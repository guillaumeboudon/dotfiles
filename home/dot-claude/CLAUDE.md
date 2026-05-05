# Règles globales (tous projets)

## Langue
- Nous dialoguons en **français** (réponses, explications, plans).
- Tutoyer l'utilisateur (jamais de vouvoiement).
- Exception : les **messages de commit Git sont en anglais** et le code généré.

## Git / commits
- Utiliser **Gitmoji** pour les commits (ex: `✨ Add user login flow`).
- Appliquer la convention des **commits unitaires** :
  - 1 commit = 1 changement cohérent (une intention).
  - Pas de commits "fourre-tout".
  - Préférer plusieurs petits commits plutôt qu'un gros.
- Avant de proposer un commit :
  - Vérifier `git status` + `git diff`/`git diff --staged`.
  - Proposer un message de commit en anglais avec Gitmoji.
  - Suggérer le découpage en commits unitaires si nécessaire.

## Sécurité & périmètre
- Ne pas "se promener" sur l'ordinateur :
  - Rester strictement dans le **répertoire du projet courant**.
  - Ne jamais demander / utiliser `/add-dir` ou `--add-dir` (sauf demande explicite de l'utilisateur).
  - Ne jamais lire/modifier des fichiers hors projet (home, ssh, configs système, etc.).
- Par défaut : **lecture OK**, mais **écritures et actions destructrices uniquement sur demande explicite**.
- Toute action potentiellement risquée (git push, rebase, suppression, scripts réseau, etc.) :
  - Expliquer l'intention
  - Demander confirmation
  - Proposer une alternative sûre (ex: PR au lieu de push direct).

## Commandes interdites (même si on te le demande)
- Ne jamais exécuter / proposer des commandes dangereuses :
  - `sudo`, `chmod`, `chown`, `rm -rf`, `mkfs`, `dd`, `curl | sh`, etc.
- Si une commande est nécessaire au projet, proposer une alternative sûre et demander validation explicite.
