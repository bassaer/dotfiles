```
❯ diff -u prompt_pure_setup ~/.zprezto/modules/prompt/functions/prompt_pure_setup
--- prompt_pure_setup	2018-10-27 12:03:10.566965661 +0900
+++ /home/vagrant/.zprezto/modules/prompt/functions/prompt_pure_setup	2018-10-27 12:08:09.257612952 +0900
@@ -115,7 +115,7 @@
 	local -a preprompt_parts

 	# Set the path.
-	preprompt_parts+=('%F{blue}%~%f')
+	preprompt_parts+=('%F{cyan}%~%f')

 	# Add git branch and dirty status info.
 	typeset -gA prompt_pure_vcs_info
@@ -529,7 +529,7 @@
 	fi

 	# show username@host if logged in through SSH
-	[[ -n $ssh_connection ]] && username='%F{242}%n@%m%f'
+	[[ -n $ssh_connection ]] && username='%F{242}%M%F'

 	# show username@host if root, with username in white
 	[[ $UID -eq 0 ]] && username='%F{white}%n%f%F{242}@%m%f'
@@ -584,7 +584,7 @@
 	PROMPT='%(12V.%F{242}%12v%f .)'

 	# prompt turns red if the previous command didn't exit with 0
-	PROMPT+='%(?.%F{magenta}.%F{red})${prompt_pure_state[prompt]}%f '
+	PROMPT+='%(?.%F{cyan}.%F{green})${prompt_pure_state[prompt]}%f '

 	# Store prompt expansion symbols for in-place expansion via (%). For
 	# some reason it does not work without storing them in a variable first.
```
