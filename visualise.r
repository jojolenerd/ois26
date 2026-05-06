# -*- coding: utf-8 -*-
# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .r
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.19.1
#   kernelspec:
#     display_name: R
#     language: R
#     name: ir
# ---

# %%
#visualisation de jsp quoi, chargement librairie
library(ggplot2)

#génération de données simulée
set.seed(42)
n <- 1000
data <- data.frame(
    x = rnorm(n),
    y = rnorm(n)
    )
#ajout d'une variable catégorielle
data$group <- ifelse(data$x + data$y > 0, "A", "B")

#visualisation avancée
ggplot(data, aes(x = x, y = y))+
geom_point(aes(color = group), alpha = 0.6)+
stat_density_2d(aes(fill = after_stat(level)),
                geom = "polygon", alpha = 0.3)+
scale_color_manual(values = c("A" = "blue", "B" = "red"))+
  labs(
    title = "Distribution 2D avec densité",
    subtitle = "Points colorés + contours de densité",
    x = "Variable X",
    y = "Variable Y"
  ) +
  theme_minimal()



# %%
