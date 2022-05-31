require(["nbextensions/snippets_menu/main"], function (snippets_menu) {
    console.log('Loading `snippets_menu` customizations from `custom.js`');
    var horizontal_line = '---';
    var my_favorites = {
        'name' : 'Misc\.',
        'sub-menu' : [
            {
                'name' : 'Show all output',
                'snippet' : ['from IPython.core.interactiveshell import InteractiveShell',
                             'InteractiveShell.ast_node_interactivity = "all"',],
            },
            {
                'name' : 'Cache function output',
                'snippet' : ['from joblib import Memory',
                             '# memory = Memory(location=<dir>, verbose=0)',
                             '# Use as decorator:',
                             '# @memory.cache',
                             '# def function()',
                             '#     ...',
                             '# or memory.cache(fun)()'],
            },
            {
                'name' : 'Another menu item',
                'snippet' : ['another_new_command(2.78)',],
            },
        ],
    };
    snippets_menu.options['menus'] = snippets_menu.default_menus;
    snippets_menu.options['menus'][0]['sub-menu'].push(horizontal_line);
    snippets_menu.options['menus'][0]['sub-menu'].push(my_favorites);
    console.log('Loaded `snippets_menu` customizations from `custom.js`');
});
