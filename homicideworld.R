library(plotly)
library(dplyr)
library(readr)
newdata= homicide2019 %>%
  inner_join(wikipedia_iso_country_codes,by.x= Country, by.y= Country)%>%
  select(Year,Country,code3, value )%>%
  mutate(ticket=paste0(Country,"\n",value))

maphomicide = plot_geo(newdata,locationmode = 'world', frame= ~Year)%>%
  add_trace(locations = ~code3 ,z= ~value,color= ~value,text=~ticket,hoverinfo='text')

