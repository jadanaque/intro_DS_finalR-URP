credito_escolar <- read.table("CREDITO ESCOLAR-REC.txt", header = TRUE)

modelo_cred <- glm(caso~., family = binomial(), data = credito_escolar)
summary(modelo_cred)

# vemos que la variable edad es no significativa, así que ajustamos el modelo

modelo_cred <- glm(caso~hijos+creditos+tarjetas, family = binomial(), data = credito_escolar)
summary(modelo_cred)

predict(modelo_cred, type="response")

nueva_data <- data.frame(edad = c(48, 80, 40), hijos = c(2, 3, 8), creditos = c(2, 3, 1), tarjetas = c(2, 1, 3))
probs <- predict(modelo_cred, nueva_data ,type="resp")

nueva_data <- data.frame(nueva_data, yest = ifelse(probs <= 0.5, 0, 1))
