window.onpageshow = function(event) {
    if (event.persisted) {
        window.location.reload()     // you can add whatever you want to execute
    }
};