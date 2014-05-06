require(pocr, quietly = T)
require(extrafont)
Sys.setenv(R_GSCMD = "C:/Program Files/gs/gs9.02/bin/gswin64c.exe")

setwd("S:/Data Portal/blog")


my_fig.height <- 3.5
rel_y_size <- 3

query <-
    "select datepart(hh, rfrd_date) referral_hour
, cd_access_type
, tx_access_type
, cd_invs_type
, tx_invs_type
, case when tx_final_decision = 'Screen In' then 1 else 0 end fl_screened_in 
, tx_final_decision
, case when cd_access_type = 1 and isnull(cd_invs_type, 1) = 1 then 1 else 0 end fl_cps
, fl_allegation_any
, fl_founded_any_legal
, cd_reporter
, tx_reporter
from ca_ods.base.tbl_intakes
where year(rfrd_date) = 2013"
con <- odbcConnect("POC")
intakes <- sqlQuery(con, query)
odbcClose(con)

require(dplyr, quietly= T)
int_summ <- intakes %.%
    group_by(referral_hour) %.%
    summarise(count = n())



intakes$hr <- factor(intakes$referral_hour)
levels(intakes$hr)[c(0, 12) + 1] <- c("Midnight", "Noon")
levels(intakes$hr)[1:11 + 1] <- paste(levels(intakes$hr)[1:11 + 1], "am")
levels(intakes$hr)[13:23 + 1] <- paste(1:11, "pm")

labels <- seq(3, 9, by = 3) * 1000
xlabs <- levels(intakes$hr)
xlabs[rep(c(F, T, T), 4)] <- ""

intake_plot <- ggplot(intakes, aes(x = hr)) +
    geom_histogram(fill = poc_colors[3]) +
    labs(x = "", y = "",
         title = "Number of Referrals by Time of Day") +
    scale_x_discrete(labels = xlabs) +
    theme_bw() +
    theme(text = element_text(family = "Frutiger LT Std 45 Light"),
          plot.title = element_text(size = rel(0.8),
                                    family = "Arvo"))

intake_bar <- intake_plot +
    scale_y_continuous(labels = comma_format()) +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.2))
# intake_bar

intake_rad <- intake_plot + 
    coord_polar(start = - 1 / 24 * pi) +
    theme(rect = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          axis.text.x = element_text(size = rel(0.7))) +   
    annotate(geom = "text",
             x = rep(c("Midnight", "Noon"), each = length(labels)),
             y = rep(labels, 2),
             color = "gray40",
             size = rel(rel_y_size), 
             label = rep(prettyNum(labels, big.mark = ","), 2))    

grid.arrange(intake_bar, intake_rad, ncol = 2)


png(filename = "plot1.png", width = 8, height = 4, units = "in", res = 600)
grid.arrange(intake_bar, intake_rad, ncol = 2)
dev.off()

####################################################################



labels <- seq(5, 20, by = 5) * 100
p2 <- ggplot(subset(intakes, tx_reporter %in% c("Educator", "Law Enforcement Officer")),
       aes(x = hr, fill = tx_reporter)) +
    geom_histogram() +
    scale_fill_manual(values = poc_colors[3:2], guide = F) +
    theme_bw() +
    theme(rect = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          plot.title = element_text(size = rel(1))) +
    labs(x = "", y = "",
         title = "Intakes by Reporter") +
    scale_x_discrete(labels = xlabs) +
    coord_polar(start = - 1 / 24 * pi) +
    annotate(geom = "text",
             x = rep(c("Midnight", "Noon"), each = length(labels)),
             y = rep(labels, 2),
             color = "gray40",
             size = rel(rel_y_size), 
             label = rep(prettyNum(labels, big.mark = ","), 2)) +
    facet_wrap(~ tx_reporter, ncol = 2)

png(filename = "plot2.png", width = 8, height = 4, units = "in", res = 600)
p2 +
    theme(text = element_text(family = "Frutiger LT Std 45 Light"),
          plot.title = element_text(size = rel(0.8),
                                    family = "Arvo"))
dev.off()

####################################################################



si <- intakes %.% group_by(hr) %.%
    summarise(si_prop = mean(fl_screened_in))
gridlines <- si[, "hr", drop = F]
gridlines$y <- 0.5
gridlines <- rbind(gridlines, gridlines[1, ])

labels <- c(0.25, 0.5, 0.75)

p3 <- ggplot(si,
       aes(x = hr, y = si_prop)) +
    geom_bar(stat = "identity", fill = poc_colors[3]) +
    theme_bw() +
    theme(rect = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          plot.title = element_text(size = rel(1))) +
    labs(x = "", y = "",
         title = "Percentage of Referrals Screened In") +
    scale_x_discrete(labels = xlabs) +
    coord_polar(start = - 1 / 24 * pi) +
    scale_y_continuous(limits = c(0, 0.75), expand = c(0, 0),
                       breaks = labels) +
    geom_hline(yintercept = labels,
               color = c("gray70", "gray70", "gray90")) +
    annotate(geom = "text",
             x = rep(c("Midnight", "Noon"), each = length(labels)),
             y = rep(labels, 2) - 0.02,
             color = "gray40",
             size = rel(rel_y_size), 
             label = rep(paste0(100 * labels, "%"), 2))

cps <- intakes %.%
    filter(fl_cps == 1) %.%
    group_by(referral_hour) %.%
    summarise(prop_founded = mean(fl_founded_any_legal),
              count = n())
cps$hr <- si$hr


png(filename = "plot3.png", width = 4, height = 4, units = "in", res = 600)
p3 +
    theme(text = element_text(family = "Frutiger LT Std 45 Light"),
          plot.title = element_text(size = rel(0.8),
                                    family = "Arvo"))
dev.off()

####################################################################



labels <- seq(.05, 0.2, by = 0.05)

p4 <- ggplot(cps,
       aes(x = hr, y = prop_founded)) +
    geom_bar(stat = "identity", fill = poc_colors[3]) +
    theme_bw() +
    theme(rect = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks.y = element_blank(),
          plot.title = element_text(size = rel(1))) +
    labs(x = "", y = "",
         title = "Percentage of CPS Investigations\nResulting in a Substantiated Allegation") +
    scale_x_discrete(labels = xlabs) +
    coord_polar(start = - 1 / 24 * pi) +
    scale_y_continuous(limits = c(0, 0.2), expand = c(0, 0),
                       breaks = labels) +
    geom_hline(yintercept = labels,
               color = c("gray70", "gray70", "gray70", "gray90")) +
    annotate(geom = "text",
             x = rep(c("Midnight", "Noon"), each = length(labels)),
             y = rep(labels, 2) - 0.01,
             color = "gray40",
             size = rel(rel_y_size), 
             label = rep(paste0(100 * labels, "%"), 2))

png(filename = "plot4.png", width = 4, height = 4, units = "in", res = 600)
p4 +
    theme(text = element_text(family = "Frutiger LT Std 45 Light"),
          plot.title = element_text(size = rel(0.8),
                                    family = "Arvo"))
dev.off()
