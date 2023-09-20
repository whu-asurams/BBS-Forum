<?php
$PHORUM["DATA"]["LANG"]["mod_spamhurdles"] = array
(
    // Code CAPTCHA
    "CaptchaTitle" =>
        "Mesure anti-SPAM :",
    "CaptchaExplain" =>
        "Inscrivez le code que vous voyez dans le champs appropri�.
         Cette mesure sert � bloquer les robots informatiques qui tentent
         de polluer ce site.",
    "CaptchaUnclearExplain" =>
        "Si le code n'est pas clair, essayer de le deviner. Si vous
         faites erreur, une nouvelle image sera cr�e et vous aurez la
         chance de r�-essayer.",
    "CaptchaSpoken" =>
        "�coutez la version orale du code (en anglais seulement).",
    "CaptchaFieldLabel" =>
        "R�p�ter le code ici :",
    "CaptchaWrongCode" =>
        "Le code que vous avez entr� pour la mesure anti-SPAM est incorrect.
         SVP r�-essayer.",

    // CAPTCHA Math�matique
    "MaptchaTitle" =>
        " Mesure anti-SPAM :",
    "MaptchaExplain" =>
        "R�soudre la question math�matique et ins�rer la r�ponse dans le
         champs appropri�. Cette mesure sert � bloquer les robots
         informatiques qui tentent de polluer ce site.",
    "MaptchaQuestion" =>
        "Question : que font {NUMBER1} plus {NUMBER2}?",
    "MaptchaSpoken" =>
        "�coutez la version orale du code (en anglais seulement).",
    "MaptchaFieldLabel" =>
        "R�ponse : ",
    "MaptchaWrongAnswer" =>
        "Le code que vous avez entr� pour la mesure anti-SPAM est incorrect.
         SVP r�-essayer",

    // CAPTCHA en Javascript.
    "JavascriptCaptchaNoscript" =>
        "[SVP activer la fonction JavaScript pour voir le code]",

    // A message that is shown when a bot post is suspected.
    "PostingRejected" =>
        "The data that you have submitted to the server have been rejected,
         because it looks like they were posted by an automated bot.",

    // A message for failed spam hurdle checks, for which a repost
    // of the form could make a difference.
    "TryResubmit" =>
        "You can try to resubmit your form data.",

    // A message for failed spam hurdle checks, for which the problem
    // might be lack of javascript support in the browser (either
    // absent or disabled).
    "NeedJavascript" =>
        "If your browser has no JavaScript support or if JavaScript is diabled,
         then this might be the cause of the problem.
         JavaScript must be enabled for submitting this form.",

    // A message that tells the user to contact the site owner
    // if the problems persist.
    "ContactSiteOwner" =>
        "If you keep having problems with your data being blocked,
         then please contact the site owner for help."
);
?>
