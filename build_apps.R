library(shinylive)

# Lese 1_datentypen.qmd
qmd_content <- readLines("1_datentypen.qmd")

# Finde alle shinylive-r Chunks
in_chunk <- FALSE
chunk_lines <- c()
chunk_count <- 0

for (line in qmd_content) {
  if (grepl("^```\\{shinylive-r\\}", line)) {
    in_chunk <- TRUE
    chunk_lines <- c()
  } else if (in_chunk && grepl("^```$", line)) {
    in_chunk <- FALSE
    chunk_count <- chunk_count + 1
    
    # Entferne YAML-Header-Zeilen (#|)
    code_lines <- chunk_lines[!grepl("^#\\|", chunk_lines)]
    code <- paste(code_lines, collapse = "\n")
    
    # Erstelle App-Ordner
    app_dir <- paste0("/tmp/shiny_app_", chunk_count)
    dir.create(app_dir, showWarnings = FALSE)
    writeLines(code, file.path(app_dir, "app.R"))
    
    # Exportiere als Shinylive-Bundle
    # ID aus Inhalt generieren
    id <- digest::digest(code, algo = "md5")
    out_dir <- paste0("docs/app_", id)
    
    tryCatch({
      shinylive::export(app_dir, out_dir)
      cat("Created:", out_dir, "\n")
    }, error = function(e) {
      cat("Error for chunk", chunk_count, ":", e$message, "\n")
    })
    
    chunk_lines <- c()
  } else if (in_chunk) {
    chunk_lines <- c(chunk_lines, line)
  }
}

cat("Total chunks processed:", chunk_count, "\n")
