:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/html_head)).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).

:- http_handler(/, say_hi, []).

say_hi(_Request) :-
        reply_html_page(
            [title('title'),
            \css('style.css'),
            \html_receive(css)
            ],
            [
             h1('my webpage'),
             p(class=paragraph, 'paragraph'),
             p([class=bodytext, style='font-size:120%'],['bigger text ',b('some bold')])
            ]
        ).
        
        
css(URL) -->
        html_post(css,
                  link([ type('text/css'),
                         rel('stylesheet'),
                         href(URL)
                       ])).