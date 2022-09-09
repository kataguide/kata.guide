# kata.guide

Source for Kata's public website [(kata.guide)](https://kata.guide), which contains tutorials, documentations, and the developer blog. 

Based on ["Just the Docs" theme](https://just-the-docs.github.io/just-the-docs/) [GitHub repo](https://github.com/just-the-docs/just-the-docs).


## Usage

Once you [setup Jekyll](https://jekyllrb.com/docs/step-by-step/01-setup/), install the dependencies:

```shell
$ bundle install
```

Then, to run and host on your local machine:

```shell
$ bundle exec jekyll serve
Configuration file: /Users/cade/code/kata.guide/_config.yml
            Source: /Users/cade/code/kata.guide
       Destination: /Users/cade/code/kata.guide/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
                    done in 0.826 seconds.
 Auto-regeneration: enabled for '/Users/cade/code/kata.guide'
    Server address: http://127.0.0.1:4000/just-the-docs/
  Server running... press ctrl-c to stop.
```


## Software

This blog has a lot of builtin integrations with common tools. here's a quick list:

  * [kramdown](https://kramdown.gettalong.org/syntax.html): for parsing `.md` (markdown) files
  * [Disqus](https://disqus.com/): for comments
  * [Prism.js](https://prismjs.com/): for code highlighting
    * [example: shell/commandline highlighting](https://github.com/cadebrown/cadebrown.github.io/blob/main/_posts/2021-09-28-diy-regex-engine.md)
    * [example: tree/directory view](https://prismjs.com/plugins/treeview/)
    * [example: pretty 'diff' output](https://prismjs.com/plugins/diff-highlight/)
    * if you're not satisfied with my Prism config, [use their wizard](https://prismjs.com/download.html)
    * to add more languages, add them in the [js/components](./js/components) folder (TODO: example of this)
  * [KaTeX](https://www.katex.org/): for math formatting (LaTeX-like, and much faster than MathJax)
    * to use it in a post, use `\( x^2 + x + 5 \)` (for inline), or `$$ x^2 + x + 5 $$` (for block mode)
  * [git.io](https://git.io/): for URL shortening (useful for gists)
  * [GitHub Buttons](https://buttons.github.io/): the style is included in the head element, so just paste the element!
  * Google Analytics: for analyzing your web traffic
