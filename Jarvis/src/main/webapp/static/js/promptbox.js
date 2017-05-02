function prompt(promptWord, promptStatus) {
    if (promptStatus === "undefined") {
        promptStatus = 'normal';
    } else if (promptStatus == "success") {
        promptStatus = 'success';
    } else if (promptStatus == "warning") {
        promptStatus = 'warning';
    } else if (promptStatus == "error") {
        promptStatus = 'error';
    } else {
        promptStatus = 'normal';
    }
    $('<div class="promptbox ' +promptStatus + '"><span class="prompt-label"></span><span class="prompt-word">' + promptWord + '</span></div>')
        .appendTo('body')
        .animate({ bottom: '+=15', opacity: "show" }, 700);

    for (i = 1; i < $('.promptbox').length; i++) {
        $('.promptbox').eq(i - 1).finish().animate({ 'bottom': '+=30' });
    }

    setTimeout(function () {
        $('.promptbox:eq(0)').remove();
    }, 3000);
}