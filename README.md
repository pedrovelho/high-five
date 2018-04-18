# High-five

This is a simple use of R with highcharter example. 

## Disclaimer

We assume here after that you already cloned this repo and put yourself on
the project folder.

## Dependecies

Install R and a basic package to embed all the graph needs in a single 
html file.

```bash
sudo apt-get -y install r-base pandoc pandoc-citeproc
```

Run R with superuser access to complete installation.

```bash
sudo R
```

Execute the following installation.

```R
install.packages("highcharter")
install.packages("htmlwidgets")
```

# Test

Go inside the folder and run the command.

```bash
./devstats.R
```

Open the index.html file with your favority browser, like firefox.

```bash
firefox index.html
```


