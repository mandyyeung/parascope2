$(document).on('page:change', function() {
    YUI({
        classNamePrefix: 'pure'
    }).use('gallery-sm-menu', function (Y) {

        var horizontalMenu = new Y.Menu({
            container         : '.home-menu.pure-menu.pure-menu-open.pure-menu-horizontal.pure-menu-fixed',
            sourceNode        : '#controls',
            orientation       : 'horizontal',
            hideOnOutsideClick: false,
            hideOnClick       : false
        });

        horizontalMenu.render();
        horizontalMenu.show();

    });
});