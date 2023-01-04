# **READ ME :TP Scaleway Terraform, Sécurité et Réseaux**


Boulogne NATHAN


**Cas n°3 : Un équilibreur de charge qui distribue les requêtes sur 3 instances**

Vous configurez un Load Balancer qui répartit les requêtes entrantes sur 3 serveurs (de type DEV1_S) différents.

![](https://i.imgur.com/bwaiYfg.png)


![](https://i.imgur.com/oeEwv3w.png)



création serveur web 1:

`scw instance server create type=DEV1-S zone=fr-par-1 image=debian_bullseye root-volume=l:10G name=web1 ip=new project-id=f8f64f6d-0933-4758-be35-c07395306199`

Création serveur web 2

`scw instance server create type=DEV1-S zone=fr-par-1 image=debian_bullseye root-volume=l:10G name=web2 ip=new project-id=f8f64f6d-0933-4758-be35-c07395306199`

Création serveur web 2

`scw instance server create type=DEV1-S zone=fr-par-1 image=debian_bullseye root-volume=l:10G name=web3 ip=new project-id=f8f64f6d-0933-4758-be35-c07395306199`


Chacun des serveurs héberge un serveur web (nginx ou apache au choix) avec une page d’index, cette page doit afficher l’id de l’instance (en fonction de l’instance qui traite la requête). 



La création des instances est faite via le CLI Scaleway.

















