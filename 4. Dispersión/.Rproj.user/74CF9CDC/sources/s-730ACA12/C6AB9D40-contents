
# Cargar librerias --------------------------------------------------------
library(pacman) # permite cargar paquetes en simultáneo
p_load(dplyr, ggplot2, datos, hrbrthemes)


# Elaborar gráfico -----------------------------------------------------------

## HISTOGRAMA
g1 <- na.omit(pinguinos) %>% 
  ggplot(aes(x = largo_pico_mm,
             y = alto_pico_mm,
             color = especie,
             alpha = 1/2)) +
  geom_point() +
  theme_ipsum_rc() +
  scale_color_manual(values = c("#004B63","#FF7A4F","#30B8B2")) +
  guides(alpha = FALSE) +
  labs(title = "Gráfica de dispersión",
       caption = "Elaborado por Jorge Huanca Martinez",
       color = "especies",
       x = NULL,
       y = NULL) +
  theme(legend.position = "bottom")

# Guardar gráfico -----------------------------------------------------------
ggsave("dispersion.png", g1, width = 5, height = 4.5, scale = 1, dpi = 300)
