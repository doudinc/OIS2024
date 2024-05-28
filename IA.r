# Installer ggplot2 si ce n'est pas déjà fait
if (!require(ggplot2)) {
  install.packages("ggplot2")
}

# Charger ggplot2 sans les messages informatifs
suppressPackageStartupMessages(library(ggplot2))

# Utiliser le dataset mpg
data("mpg")

# Créer le graphique
ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(size = 3, alpha = 0.7) +             # Ajouter des points avec taille et transparence
  geom_smooth(method = "lm", formula = y ~ x, se = TRUE) +  # Ajouter une ligne de régression avec formule explicite
  facet_wrap(~ drv) +                             # Facetter par type de transmission (drv)
  labs(title = "Consommation de carburant par cylindrée",
       subtitle = "Données de consommation de carburant (mpg) par type de transmission",
       x = "Cylindrée (L)",
       y = "Consommation sur autoroute (mpg)",
       color = "Classe de véhicule") +            # Ajouter des étiquettes et un titre
  theme_minimal()                                 # Utiliser un thème minimal pour une meilleure lisibilité

# Sauvegarder le graphique en tant que fichier PNG
ggsave("visualisation_mpg.png", width = 10, height = 6)
