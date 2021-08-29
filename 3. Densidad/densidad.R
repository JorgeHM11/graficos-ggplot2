
# Cargar paquetes ---------------------------------------------------------
library(pacman)
p_load(datos,tidyverse,hrbrthemes,ggridges,viridis,ggsci)

# Elaborar gráficos -------------------------------------------------------

## DIAGRAMA DE DENSIDAD
g1 <- na.omit(pinguinos) %>% 
  ggplot(aes(x = largo_pico_mm,
             fill = especie)) +
  geom_density(color = "white",
               show.legend = FALSE) +
  labs(title = "Distribución del largo del pico") +
  facet_wrap(~ especie,
             strip.position = "top",
             nrow = 3) +
  scale_y_continuous(breaks = NULL) +
  scale_x_continuous(breaks = seq(35, 60, 5)) +
  scale_fill_manual(values = c("#F2CC39","#506AD4","#FFFCE6")) +
  theme_modern_rc() +
  theme(plot.title = element_text(size = 30)) +
  theme(strip.text.x = element_text(size = 20, colour = "white")) 

## DIAGRAMA DE DENSIDAD. FACET GRID
g2 <- na.omit(pinguinos) %>% 
  ggplot(aes(x = largo_pico_mm,
             fill = especie)) +
  geom_density(col = FALSE) + 
  scale_fill_ipsum() +
  theme_ipsum_rc() +
  theme(legend.position = "bottom",
        legend.direction = "horizontal") +
  labs(title = "Distribución del largo del pico",
       caption = "Gráfica elaborada por Jorge Huanca",
       x = NULL,
       y = NULL) +
  facet_grid(rows = vars(especie),
           cols = vars(isla)) 

## DIAGRAMA DE DENSIDAD. FACET WRAP
g3 <- pinguinos %>% 
  ggplot(aes(x=largo_pico_mm,
             fill = especie)) +
  geom_density(col = "black") +
  scale_fill_ft() +
  theme_ipsum_rc() +
  theme(legend.position = "bottom",
        legend.direction = "horizontal") +
  labs(title = "Distribución del largo del pico",
       caption = "Gráfica elaborada por Jorge Huanca",
       x = "Largo del pico",
       y = "Densidad") +
  facet_wrap( ~ especie + isla, nrow = 2) +
  scale_y_continuous(breaks = c(0, 0.15),
                     labels = c("Nula", "Alto")) +
  scale_x_continuous(breaks = seq (35, 60, 5))

## DIAGRAMA DE DENSIDAD GGRIDGES
g4 <- paises %>% 
  ggplot(aes(x = esperanza_de_vida,
             y = continente,
             fill = ..x..)) +
  geom_density_ridges_gradient(scale = 3, rel_min_height = 0.01) +
  theme_ipsum_rc() +
  scale_fill_viridis(name = "Temp. [F]", option = "A") +
  theme(legend.position = "none") +
  labs(title = "Distribución de la esperanza de vida según continente",
       subtitle = "Se observan marcadas diferencias entre Oceanía y Asia",
       caption = "Gráfica elaborada por Jorge Huanca Martinez") +
  scale_x_continuous(breaks = seq (20, 90, 10)) 



# Guardar gráficos --------------------------------------------------------
ggsave("densidad.png", g1, width = 5, height = 5, scale = 2, dpi = 300)
ggsave("densidad_grid.png", g2, width = 4, height = 3, scale = 2, dpi = 300)
ggsave("densidad_wrap.png", g3, width = 5, height = 4, scale = 2, dpi = 300)
ggsave("densidad_ggridges.png", g4, width = 5, height = 4, scale = 2, dpi = 300)

