
# Cargar librerias --------------------------------------------------------
library(pacman) # permite cargar paquetes en simultáneo
p_load(dplyr, ggplot2, datos, hrbrthemes)

# Elaborar gráfico -----------------------------------------------------------

## HISTOGRAMA
g1 <- pinguinos %>% 
  filter(especie == c("Adelia", "Papúa")) %>% 
  ggplot(aes(x = masa_corporal_g,
             fill = especie)) +
  geom_histogram(alpha = 1/3,
                 position = "identity") +
  guides(alpha = FALSE) +
  theme_ipsum() +
  scale_fill_manual(values=c("#69b3a2", "#404080")) +
  labs(title = "Histograma de 2 categorías",
       caption = "Jorge Huanca Martinez") +
  theme(legend.position = "bottom")

# Guardar gráfico -----------------------------------------------------------
ggsave("histograma.png", g1, width = 5, height = 4.5, scale = 1, dpi = 300)
