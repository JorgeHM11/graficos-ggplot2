# Cargar librerias --------------------------------------------------------
library(pacman)
p_load(dplyr, ggplot2, reshape2, datos, apaTables, psych, corrr)

flores <- select(flores, -Especies) #Seleccionar variables continuas

# Elaborar gráficos -----------------------------------------------------------

# Mapa de calor
g1 <- melt(cor(flores)) %>% 
  ggplot(aes(x = Var1, y = Var2, fill = value)) +
  geom_tile(color = "white",
            lwd = 1.5,
            linetype = 1) +
  coord_fixed() +
  labs(x = NULL, y = NULL) +
  geom_text(aes(label = round(value,2)), color = "white", size = 6) +
  scale_fill_gradient2(low = "#F2E744",
                       mid = "#F2B705", 
                       high = "#F29F05") +
  guides(fill = guide_colourbar(barwidth = 0.8,
                                barheight = 15,
                                title = "valor")) +
  theme_classic()

# Diagrama de redes
g2 <- correlate(flores, method = "pearson") %>% 
  network_plot()

# Histograma y dispersión 
pairs.panels(flores, pch = 20,stars = TRUE, main = "Correlación de variables")

# Exportar tabla en formato APA -------------------------------------------
apa.cor.table(flores, filename = "tabla_correlacion.doc", table.number = 1,
              show.conf.interval = FALSE, landscape = TRUE)

# Guardar gráficos -----------------------------------------------------------
ggsave("correlacion_heatmap.png", g1)
ggsave("correlacion_redes.png", g2)
