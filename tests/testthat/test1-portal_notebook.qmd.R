# Vérifications de portal_notebook.qmd
portal <- parse_rmd("../../portal_notebook.qmd",
  allow_incomplete = TRUE, parse_yaml = TRUE)

test_that("Le bloc-notes portal_notebook est-il compilé en un fichier final HTML ?", {
  expect_true(is_rendered("portal_notebook.qmd"))
  # La version compilée HTML du carnet de notes portal_notebook est introuvable
  # Vous devez créer un rendu de votre bloc-notes Quarto (bouton 'Rendu')
  # Vérifiez aussi que ce rendu se réalise sans erreur, sinon, lisez le message
  # qui s'affiche dans l'onglet 'Travaux' et corrigez ce qui ne va pas dans
  # votre document avant de réaliser à nouveau un rendu HTML.
  # IL EST TRES IMPORTANT QUE VOTRE DOCUMENT COMPILE ! C'est tout de même le but
  # de votre analyse que d'obtenir le document final HTML.

  expect_true(is_rendered_current("portal_notebook.qmd"))
  # La version compilée HTML du document Quarto existe, mais elle est ancienne
  # Vous avez modifié le document Quarto après avoir réalisé le rendu.
  # La version finale HTML n'est sans doute pas à jour. Recompilez la dernière
  # version de votre bloc-notes en cliquant sur le bouton 'Rendu' et vérifiez
  # que la conversion se fait sans erreur. Sinon, corrigez et regénérez le HTML.
})

test_that("La structure du document portal_notebook est-elle conservée ?", {
  expect_true(all(c("Introduction et but", "Matériel et méthodes",
    "Résultats", "Modèle des données", "Extraction des données d'intérêt",
    "Description et transformation des données",
    "Positionnement multidimensionnel", "MDS métrique", "MDS non métrique",
    "Diagramme de Shepard", "Graphique de la MDS non métrique",
    "Discussion et conclusions", "Références")
    %in% (rmd_node_sections(portal) |> unlist() |> unique())))
  # Les sections (titres) attendues du bloc-notes portal_notebook ne sont pas
  # toutes présentes
  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs titres indispensables par rapport aux exercices ont disparu ou ont
  # été modifié. Vérifiez la structure du document par rapport à la version
  # d'origine dans le dépôt "template" du document (lien au début du fichier
  # README.md).

  expect_true(all(c("setup", "connect", "dm", "explore", "fields", "tables",
    "tables_sizes", "tablescomment", "primary_keys", "foreign_keys", "filter",
    "summarise", "disconnect", "plot", "plotcomment", "wider", "dist", "mds",
    "mdscomment", "mds2", "mds2comment", "shepard", "shepardcomment",
    "mds2chart", "mds2chartcomment") %in% rmd_node_label(portal)))
  # Un ou plusieurs labels de chunks nécessaires à l'évaluation manquent dans
  # portal_notebook.qmd
  # Ce test échoue si vous avez modifié la structure du document, un ou
  # plusieurs chunks indispensables par rapport aux exercices sont introuvables.
  # Vérifiez la structure du document par rapport à la version d'origine dans
  # le dépôt "template" du document (lien au début du fichier README.md).

  expect_true(any(duplicated(rmd_node_label(portal))))
  # Un ou plusieurs labels de chunks sont dupliqués dans portal_notebook.qmd
  # Les labels de chunks doivent absolument être uniques. Vous ne pouvez pas
  # avoir deux chunks qui portent le même label. Vérifiez et modifiez le label
  # dupliqué pour respecter cette règle. Comme les chunks et leurs labels sont
  # imposés dans ce document cadré, cette situation ne devrait pas se produire.
  # Vous avez peut-être involontairement dupliqué une partie du document ?
})

test_that("L'entête YAML a-t-il été complété dans portal_ca ?", {
  expect_true(portal[[1]]$author != "___")
  expect_true(!grepl("__", portal[[1]]$author))
  expect_true(grepl("^[^_]....+", portal[[1]]$author))
  # Le nom d'auteur n'est pas complété ou de manière incorrecte dans l'entête
  # Vous devez indiquer votre nom dans l'entête YAML à la place de "___" et
  # éliminer les caractères '_' par la même occasion.

  expect_true(grepl("[a-z]", portal[[1]]$author))
  # Aucune lettre minuscule n'est trouvée dans le nom d'auteur
  # Avez-vous bien complété le champ 'author' dans l'entête YAML ?
  # Vous ne pouvez pas écrire votre nom tout en majuscules. Utilisez une
  # majuscule en début de nom et de prénom, et des minuscules ensuite.

  expect_true(grepl("[A-Z]", portal[[1]]$author))
  # Aucune lettre majuscule n'est trouvée dans le nom d'auteur
  # Avez-vous bien complété le champ 'author' dans l'entête YAML ?
  # Vous ne pouvez pas écrire votre nom tout en minuscules. Utilisez une
  # majuscule en début de nom et de prénom, et des minuscules ensuite.
})

test_that("Chunk 'connect' : connexion à la base de données SQLite", {
  expect_true(is_identical_to_ref("connect"))
  # La connexion à la base de données n'est pas réalisée
  # Vérifiez que le fichier `data/portal_mammals.sqlite` est bien là.
  # Vérifiez le code que vous utilisez pour vous y connecter.
})

test_that("Chunk 'dm' : création du modèle de données", {
  expect_true(is_identical_to_ref("dm"))
  # Le modèle de données n'est pas créé ou n'est pas celui attendu
  # Vous ne devez pas apprendre les clés depuis la base de données.
})

test_that("Chunks 'explore', 'fields', 'tables', 'tables_sizes', 'tablescomment' : exploration de la base de données", {
  expect_true(is_identical_to_ref("explore"))
  # L'objet créé au chunk 'explore' n'est pas celui attendu
  # Vous devez lister les tables présentes dans la base de données.

  expect_true(is_identical_to_ref("fields"))
  # L'objet créé au chunk 'fields' n'est pas celui attendu
  # Vous devez lister les champs dans lestables présentes dans la base de
  # données.

  expect_true(is_identical_to_ref("tables"))
  # L'objet créé au chunk 'tables' n'est pas celui attendu
  # Vous devez extraire les 10 premiers items de chaque table et les afficher.
  # Le code est prérempli donc, ce test ne devrait pas échoué si vous êtes
  # correctement connecté et que la base n'a pas été modifiée.

  expect_true(is_identical_to_ref("tables_sizes"))
  # L'objet créé au chunk 'tables_sizes' n'est pas celui attendu
  # Vous devez créer un vecteur contenant la taille de vos tables.
  # Le code est prérempli donc, ce test ne devrait pas échoué si vous êtes
  # correctement connecté et que la base n'a pas été modifiée.

  expect_true(is_identical_to_ref("tablescomment"))
  # Les commentaires sur le structure des tables est (partiellement) fausse dans
  # le chunk 'tablescomment'
  # Vous devez cochez les phrases qui décrivent les graphiques et la table d'un
  # 'x' entre les crochets [] -> [x]. Ensuite, vous devez recompiler la version
  # HTML du bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les
  # résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'primary_keys', 'foreign_keys' : définition des clés dans le modèle de données", {
  expect_true(is_identical_to_ref("primary_keys"))
  # Les clés primaires ne sont pas définies ou ne sont pas celles attendues.
  # Utilisez la fonction qui permet de diagnostiquer les clés primaires
  # potentielles à bon escient pour les définir.

  expect_true(is_identical_to_ref("foreign_keys"))
  # Les clés étrangères ne sont pas définies ou ne sont pas celles attendues.
  # Utilisez la fonction qui permet de diagnostiquer les clés étrangères
  # potentielles à bon escient pour les définir.
})

test_that("Chunks 'filter', 'summarise', 'disconnect' : extraction des données d'intérêt de la base", {
  expect_true(is_identical_to_ref("filter"))
  # Le filtre de données n'est pas fait ou  n'est pas celui attendu dans le
  # chunk 'filter'.
  # Vérifiez votre code par rapport à l'énoncé.

  expect_true(is_identical_to_ref("summarise", "names"))
  # Les colonnes dans le tableau `rodent_sum` ne sont pas celles attendues
  # Votre jeu de données extrait de la base n'est pas correct. Ce test échoue si
  # l'extraction et/ou le remaniement des données n'est pas le bon.

  expect_true(is_identical_to_ref("summarise", "classes"))
  # La nature des variables (classe) dans le tableau `rodent_sum` est incorrecte
  # Votre jeu de données extrait de la base n'est pas correct. Ce test échoue si
  # l'extraction et/ou le remaniement des données n'est pas le bon.

  expect_true(is_identical_to_ref("summarise", "nrow"))
  # Le nombre de lignes dans le tableau `rodent_sum` est incorrect
  # Votre jeu de données extrait de la base n'est pas correct. Ce test échoue si
  # l'extraction et/ou le remaniement des données n'est pas le bon.

  expect_true(is_identical_to_ref("disconnect"))
  # Vous n'êtes pas déconnecté de la base de données.
  # Vérifier le code assurant la déconnection de la base dans le chunk
  # 'disconnect'.
})

test_that("Chunks 'plot', 'plotcomment' : graphique en boites de dispersion horizontales", {
  expect_true(is_identical_to_ref("plot"))
  # Le graphique en boites de dispersion n'est pas fait ou n'est pas celui
  # attendu dans le chunk 'plot'.
  # Assurez-vous de bien utiliser `rodent_sum`et de réaliser le bon type de
  # graphique.

  expect_true(is_identical_to_ref("plotcomment"))
  # L'interprétation des boites de dispersion horizontales est (partiellement)
  # fausse dans le chunk 'plotcomment'
  # Vous devez cochez les phrases qui décrivent le graphique d'un 'x' entre
  # les crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'wider', 'dist', 'mds', 'mdscomment' : MDS métrique", {
  expect_true(is_identical_to_ref("wider", "names"))
  # Les colonnes dans le tableau `rodent_wider` ne sont pas celles attendues
  # Votre jeu de données transformé n'est pas correct. Ce test échoue si
  # la transformation des données n'est pas le bon.

  expect_true(is_identical_to_ref("wider", "classes"))
  # La nature des variables (classe) dans le tableau `rodent_wider` est
  # incorrecte
  # Votre jeu de données transformé n'est pas correct. Ce test échoue si
  # la transformation des données n'est pas le bon.

  expect_true(is_identical_to_ref("wider", "nrow"))
  # Le nombre de lignes dans le tableau `rodent_wider` est incorrect
  # Votre jeu de données transformé n'est pas correct. Ce test échoue si
  # la transformation des données n'est pas le bon.

  expect_true(is_equal_to_ref("dist"))
  # La matrice de dissimilarité n'est pas celle attendue dans le chunk 'dist'.
  # Assurez-vous de bien utiliser `rodent_wider` ainsi que la bonne métrique
  # de dissimlarité.

  expect_true(is_equal_to_ref("mds"))
  # La MDS métrique n'est pas faite ou n'est pas celle attendue dans le chunk
  # 'mds'.
  # Vérifiez votre code dans le chunk 'mds' ainsi que le test précédent relatif
  # à la matrice de distance qui est utilisée pour la MDS.

  expect_true(is_identical_to_ref("mdscomment"))
  # L'interprétation de la MDS métrique est (partiellement) fausse dans le chunk
  # 'mdscomment'
  # Vous devez cochez les phrases qui décrivent le graphique d'un 'x' entre
  # les crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'mds2', 'mds2comment' : MDS non métrique", {
  expect_true(is_equal_to_ref("mds2"))
  # La MDS non métrique n'est pas faite ou n'est pas celle attendue dans le
  # chunk 'mds2'.
  # Vérifiez votre code dans le chunk 'mds2' ainsi que le test précédent relatif
  # à la matrice de distance qui est utilisée pour la MDS non métrique.

  expect_true(is_identical_to_ref("mds2comment"))
  # L'interprétation de la MDS non métrique est (partiellement) fausse dans le
  # chunk 'mds2comment'
  # Vous devez cochez les phrases qui décrivent le graphique d'un 'x' entre
  # les crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'shepard', 'shepardcomment' : diagramme de Shepard", {
  expect_true(is_identical_to_ref("shepard"))
  # Le diagramme de Shepard n'est pas fait ou n'est pas celui attendu dans le
  # chunk 'shepard'.
  # Vérifiez votre code dans le chunk 'shepard'. Vous devez créer un objet
  # `rodent_sh`.

  expect_true(is_identical_to_ref("shepardcomment"))
  # L'interprétation du diagramme de Shepard est (partiellement) fausse dans le
  # chunk 'shepardcomment'
  # Vous devez cochez les phrases qui décrivent le graphique d'un 'x' entre
  # les crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("Chunks 'mds2chart', 'mds2chartcomment' : diagramme de Shepard", {
  expect_true(is_identical_to_ref("mds2chart"))
  # Le graphique de la MDS non métrique n'est pas fait ou n'est pas celui
  # attendu dans le chunk 'mds2chart'.
  # Vérifiez votre code dans le chunk 'mds2chart'. Vous devez faire un graphique
  # en indiquant les labels comme plot ids ainsi que les couleurs comme type de
  # parcelle.

  expect_true(is_identical_to_ref("mds2chartcomment"))
  # L'interprétation du graphique de la MDS non métrique est (partiellement)
  # fausse dans le chunk 'mds2chartcomment'
  # Vous devez cochez les phrases qui décrivent le graphique d'un 'x' entre
  # les crochets [] -> [x]. Ensuite, vous devez recompiler la version HTML du
  # bloc-notes (bouton 'Rendu') sans erreur pour réactualiser les résultats.
  # Assurez-vous de bien comprendre ce qui est coché ou pas : vous n'aurez plus
  # cette aide plus tard dans le travail de groupe ou les interrogations !
})

test_that("La partie discussion et conclusion est-elle remplie ?", {
  expect_true(!(rmd_select(portal, by_section("Discussion et conclusions")) |>
      as_document() |> grepl("...Votre discussion ici...", x = _,
        fixed = TRUE) |> any()))
  # La discussion et les conclusions ne sont pas faites
  # Remplacez "...Votre discussion ici..." par vos phrases de commentaires
  # libres (à noter que le contenu de cette section n'est pas évalué
  # automatiquement, mais il le sera par vos enseignants).
})
