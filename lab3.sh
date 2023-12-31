#!/bin/bash

# Використовуємо 'find' для пошуку директорій в поточній директорії з максимальною глибиною 1 та мінімальною глибиною 1.
# Для знайдених директорій викликаємо 'du -sh', щоб отримати їхній розмір та вивести його.
# Результати передаємо до 'sort -hr', щоб відсортувати їх за розміром у зворотньому порядку.
# Нарешті, використовуємо 'head -3', щоб вибрати три найбільші директорії.
dirs=$(find . -maxdepth 1 -mindepth 1 -type d \
                                -exec du -sh {} + 2>/dev/null \
                                | sort -hr \
                                | head -3)

# Виводимо заголовок таблиці

printf "Largest directories:\n"
printf "%-6s %-8s %s\n" "№" "Size" "Name"

# Виводимо роздільник
printf "%s\n" "----------------------------------------"

# Цикл для ітерації через кожну директорію
counter=0
while read_data= read -r chunk; do
  ((counter++))

  # Розділяємо рядок на розмір та ім'я
  size=$(echo "$chunk" | awk '{print $1}')
  name=$(echo "$chunk" | awk '{sub(/\.\//, ""); print $2}')

  # Виводимо номер, розмір та ім'я директорії
  printf "%-4s %-8s %s\n" "$counter)" "$size" "$name"
done <<< "$dirs"
