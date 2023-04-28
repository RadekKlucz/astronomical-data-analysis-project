# :milky_way: Astronomical data analysis project

Project in R language using astronomical data. All theoretical information is available in the reports folder in pdf or html format.

## :keyboard:	About source code

This code is a mixture of R code for analyzing astronomical data related to asteroids and globular clusters. The code reads in data from files, analyzes it using statistical tests, calculates measures such as standard deviation and median standard error, and creates plots to visualize the data.

The code first loads required libraries such as **nortest**, **outliers**, and **MASS**. It then sets the working directory and loads data from three files: asteroids.txt, GlobClus_M31.dat, and GlobClus_MWG.dat. The data is sorted and assigned to variables for later use.

Next, the code calculates the standard deviation of densinity and error of the asteroids data, and uses a function to calculate the median standard error of each variable. It then creates three plots to visualize the data: a dot chart, a graph with error bars, and a boxplot.

The code then performs several statistical tests on the asteroids data using the lillie.test, shapiro.test, dixon.test, and grubbs.test functions.

After analyzing the asteroids data, the code loads and summarizes data related to globular clusters in the Milky Way and M31 galaxies. It then creates several plots to visualize the data, including a histogram and three quantile-quantile plots.

Finally, the code performs a Wilcoxon rank test on the globular clusters data using the wilcox.test function.

## 🧑‍💻 Technology stack

* R language
  * nortest
  * outliers
  * MASS
* RStudio
* LaTeX

## 🎆 How to run project

1. Install R language and RStudio,
2. Clone the repository to your computer,
3. Open data-analysis-project in RStudio.
4. Enjoy the data project.

## 🌠 Features

🌟 **Data Manipulation in R**

🌟 **Visualizing data**

🌟 **Statistical skills**

🌟 **Data analysis**

## 📁 Directory Structure

    ├───main
    │   └───data
    └───reports

## 📧 Contact

[![LinkedIn](https://i.stack.imgur.com/gVE0j.png) Radosław Kluczewski](https:///www.linkedin.com/in/radoslaw-kluczewski) 
&nbsp;
[![GitHub](https://i.stack.imgur.com/tskMh.png) RadekKlucz](https://github.com/RadekKlucz)

## License

[![Licence](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](./LICENSE)
