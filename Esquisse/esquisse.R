
# Cargar paquetes ---------------------------------------------------------
library(pacman)
p_load(tidyverse, openxlsx, esquisse, ggthemes)


# Importar base de datos --------------------------------------------------
tesis <- read.xlsx("Data simulada.xlsx")


# Modificar variables -----------------------------------------------------
tesis$AÑO <- as.character(tesis$AÑO)
tesis$UNIV <- as.character(tesis$UNIV)


# Utilizar {esquisee} -----------------------------------------------------
esquisse::esquisser(tesis) 

## Pegar código obtenido con {esquisee}
g1 <- ggplot(tesis) +
  aes(x = AÑO, fill = UNIV) +
  geom_bar() +
  scale_fill_brewer(palette = "RdBu", direction = 1) +
  labs(
    title = "Producción anual de tesis según universidad",
    fill = "Universidad"
  ) +
  coord_flip() +
  ggthemes::theme_stata() +
  theme(legend.position = "bottom")


# Guardar gráficos --------------------------------------------------------
ggsave("esquisee.png", g1, width = 5, height = 4, dpi = 300)




