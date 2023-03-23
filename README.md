Rat-kangourous dans un écosystème désertique à Portal, Arizona, USA
================

La base de données traitée dans ce projet (M. Ernest et al. 2020) est
une version simplifiée issue d’un étude portant sur le suivi à long
terme d’un écosystème désertique dans le désert du Chihuahua proche de
la ville de Portal en Arizona, USA (S. K. M. Ernest et al. 2020).

La zone d’étude s’étend sur 20 ha et est composée de 24 parcelles de
0.25 ha chacune (50m\*50m). La base de données est constituée de trois
tables :

1.  La table `plots` reprend des informations sur les traitements
    appliqués sur les parcelles :

    -   parcelles témoin (`Control`),
    -   parcelles clôturées pour exclure tous les rongeurs
        (`Rodent Exclosure`)
    -   parcelles clôturées afin d’exclure à long terme les
        rats-kangourous (`Long-term Krat Exclosure`)
    -   parcelles clôturées afin d’exclure à court terme les
        rats-kangourous (`Short-term Krat Exclosure`)
    -   parcelles clôturées pour exclure spécifiquement *Dipdomys
        spectabilis*, une espèce de rat-kangourou (`Spectab Exclosure`)

2.  La table `species` stocke le nom de genre, d’espèce et le groupe
    taxonomique correspondant à chaque code d’espèce.

3.  La table `surveys` collecte les informations relatives aux individus
    capturés.

Vous noterez que le schéma de cette base de données est incomplet car
aucun lien n’est défini entre les tables.

# Objectifs

Ce projet est individuel et cadré. Il permet de démontrer que vous avez
acquis les compétences suivantes :

-   découvrir et explorer une base de données
-   élaborer le schéma d’une base de données avec le package {dm}
-   réaliser une requête sur une base de données
-   utiliser le positionnement multidimensionnel

# Consignes

Complétez le document `docs/portal.Rmd`. Le travail va se décomposer en
trois phases :

1.  Vous élaborerez un schéma valide et optimal pour cette base de
    données proposée.
2.  Vous réaliserez une requête sur cette base par rapport à une
    question biologique.
3.  Vous utiliserez le positionnement multidimensionnel afin d’observer
    les ressemblances et les différences entre les différentes
    parcelles.

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
