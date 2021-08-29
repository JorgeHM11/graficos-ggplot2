# Cargar librerias --------------------------------------------------------
library(pacman)
p_load(dplyr, ggplot2,reshape2,datos)

# Elaborar gráfico -----------------------------------------------------------
g1 <- melt(cor(select(flores,-Especies))) %>% 
  ggplot(aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white",
            lwd = 1.5,
            linetype = 1) +
  coord_fixed() +
  geom_text(aes(label = round(value,2)), color = "white", size = 6) +
  scale_fill_gradient2(low = "#F2E744",
                       mid = "#F2B705", 
                       high = "#F29F05") +
  guides(fill = guide_colourbar(barwidth = 0.8,
                                barheight = 15,
                                title = "valor")) +
  theme_classic()

# Guardar gráfico -----------------------------------------------------------
ggsave("correlacion.png", g1)
