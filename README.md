Untitled
================

La base de données traité dans ce projet (M. Ernest et al. 2020) est une
base de données simplifié issue d’un étude portant sur le suivi à long
terme d’un écosystème désertique se trouvant dans le désert du Chihuahua
proche de la ville de Portal, Arizona (S. K. M. Ernest et al. 2020).

La zone d’étude s’étend sur 20 ha et est décomposé en 24 parcelles de
0.25 ha (50m\*50m). La base de données est composée de trois tables.

La table `plots` comprend des informations sur les traitements appliqués
sur les parcelles :

-   parcelles témoin (`Control`),
-   parcelles cloturées pour exclure tous les rongeurs
    (`Rodent Exclosure`)
-   parceles cloturées afin d’exclure à long terme les rats kangourous
    (`Long-term Krat Exclosure`)
-   parcelles cloturée afin d’exclure à court terme les rats kangourous
    (`Short-term Krat Exclosure`)
-   parcelles cloturées pour exclure spécifiquement *Dipdomys
    spectabilisn* (`Short-term Krat Exclosure`)

La table `species` comprend le le nom de genre, d’espèce et le groupe
taxonomique correspondant à chaque code d’espèce.

La table `surveys` comprend les informations relatives au individus
capturés.

# Objectifs

Ce projet est individuel et cadré. Il permet de démontrer que vous avez
acquis les compétences suivantes :

-   découvrir et explorer une base de données
-   proposer un schéma de la base de données avec le package {dm}
-   réaliser une requête sur une base de données
-   utiliser le positionnement multidimensionnel afin d’observer les
    ressemblances entre les plots étudiées.

# Consignes

Complétez le document portal.Rmd. Ce document va se décomposer en 3
phases. Vous débuterez par proposer une schéma à la base de données
proposée. Ensuite, vous réaliserez une requête spécifique sur cette
base. Enfin, vous utiliserez le le positionnement multidimensionnel afin
d’observer les ressemblances entre les plots étudiées.

N’oubliez pas de “knitter” le document en HTML à la fin du travail pour
vérifier que tout fonctionne bien, et corrigez les erreurs éventuelles
rencontrées à ce stade avant de clôturer votre travail. Vérifiez
également que votre dernier commit a bien été pushé sur GitHub avant la
deadline.

Ce projet correspond au template
<https://github.com/BioDataScience-Course/B09Ia_portalr>.

# Bibliographie

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Ernest2020" class="csl-entry">

Ernest, Morgan, James Brown, Thomas Valone, and Ethan P. White. 2020.
“Portal Project Teaching Database,” August.
<https://doi.org/10.6084/m9.figshare.1314459.v10>.

</div>

<div id="ref-Ernest332783" class="csl-entry">

Ernest, S. K. Morgan, Glenda M. Yenni, Ginger Allington, Ellen K.
Bledsoe, Erica M. Christensen, Renata M. Diaz, Keith Geluso, et al.
2020. “The Portal Project: A Long-Term Study of a Chihuahuan Desert
Ecosystem.” *bioRxiv*. <https://doi.org/10.1101/332783>.

</div>

</div>
