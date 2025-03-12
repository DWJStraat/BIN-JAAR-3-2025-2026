# normalizing per image
file_list <- list(
  "Image Analysis/Week 2/dataset/20.jpg",
  "Image Analysis/Week 2/dataset/19.jpg",
  "Image Analysis/Week 2/dataset/18.jpg",
  "Image Analysis/Week 2/dataset/17.jpg",
  "Image Analysis/Week 2/dataset/16.jpg",
  "Image Analysis/Week 2/dataset/15.jpg",
  "Image Analysis/Week 2/dataset/14.jpg",
  "Image Analysis/Week 2/dataset/13.jpg",
  "Image Analysis/Week 2/dataset/12.jpg",
  "Image Analysis/Week 2/dataset/11.jpg"
)

library(EBImage)

for (image in file_list){
  x <- readImage(image)
  x <- x[110:512,1:130]
  y <- bwlabel(x)
  display(x, title='Original')

  print(range(y))
  y = normalize(y)
  print(range(y))
  display(y, title='Segmented')
}