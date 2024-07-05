#!/bin/bash

# Controlla se l'utente ha fornito un file di input
if [ -z "$1" ]; then
  echo "Uso: $0 <file_di_input>"
  exit 1
fi

# Controlla se il file di input esiste
if [ ! -f "$1" ]; then
  echo "File di input non trovato!"
  exit 1
fi

# Legge il file di input riga per riga
while IFS= read -r ip; do
  if [ -n "$ip" ]; then
    echo "Eseguendo testssl su $ip..."
    # Esegui testssl e salva l'output in una variabile
    output=$(testssl "$ip")
    # Stampa l'output a schermo
    echo "$output"
    # Salva l'output in un file
    echo "$output" > "testssl_${ip}.txt"
    echo "Output salvato in testssl_${ip}.txt"
  fi
done < "$1"
