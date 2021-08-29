
# Establecer directorio -----------------------------------
setwd("E:Scripts R/Capacitación Interna AMP/Fuentes")

# Cargar paquetes -----------------------------------------
library(datos)
library(tidyverse)
library(plotly)
library(here)
library(extrafont)

# Importar fuentes ----------------------------------------
font_import() # import all your fonts
fonts() #get a list of fonts
fonttable()
fonttable()[40:45,] # very useful table listing the family
                    # name, font, name, etc

# Gráfica con data "flores" ------------------------------
plot1<- flores %>% 
  ggplot(aes(y = Especies,
             fill = Especies)) +
  geom_bar(show.legend = FALSE) +
  theme(aspect.ratio = 1,
        plot.title = element_text(size = 20,
                                  face = "bold",
                                  vjust = 1,
                                  lineheight = 0.6,
                                  family = "Bauhaus 93"),
        plot.subtitle = element_text(size = 10,
                                  face = "bold",
                                  vjust = 1,
                                  family = "Lucida Sans")) +
  labs(x = NULL, y = NULL,
       title = "Gráfica de prueba",
       subtitle = "Autor: Jorge Huanca-Martinez")

plot1

# Guardar plot con {here} ---------------------------------
ggsave(here("plots","plot_1.png"))

# Guardar dataset con {here} ------------------------------
flores %>% 
  write.csv(here("datos", "flores.csv"))

