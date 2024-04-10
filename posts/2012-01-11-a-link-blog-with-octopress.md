Date: 2012-01-11
Title: A Link-Blog with Octopress
Comments: true
Tags: Octopress, Blog

During the last week well known bloggers have started turning off comments in a move to not having to care about sorting out SPAM and having more time for the actual writing. [Matt Gemmell](https://mattgemmell.com/) has written an [excellent summary](https://mattgemmell.com/2012/01/07/comments-commentary/) about this, for those of you interested.

While I'm not sure yet if I'll ever do the same, I started wondering on how to realize something like a Link-Blog with Octopress. Turns out it's pretty easy.

First modify the `article.html` inside `source/_includes` and exchange the lower `<h1>` part which is responsible for the page view title with an if-else clause.

```html
<h1 class="entry-title">
  {{ "{% if page.ref_url" }} %}
    <a class="reference" href="{{ "{{ page.ref_url" }} }}">{{ "{{ page.title" }} }}</a>
  {{ "{% else" }} %}
    {{ "{% if site.titlecase" }} %}
      {{ "{{ page.title | titlecase" }} }}
    {{ "{% else" }} %}
      {{ "{{ page.title" }} }}
    {{ "{% endif" }} %}
  {{ "{% endif" }} %}
</h1>
```

Then continue with adding an if-else clause to the `atom.xml` file too. Extend the `<link>` element inside the parent `<entry>` with the code below. Done.

```html
{{ "{% if post.ref_url" }} %}
  <link href="{{ "{{ post.ref_url" }} }}"/>
{{ "{% else" }} %}
  <link href="{{ "{{ site.url" }} }}{{ "{{ post.url" }} }}"/>
{{ "{% endif" }} %}
```

If you want to create a Link-Blog post now, add `ref_url` to the markdown file header and Octopress takes care of the rest.

{% highlight text %}
Title: This Awesome Article"
date: 2012-01-13 21:20
Comments: true
ref_url: https://somesite.com/thisawesomearticle.html
This one is really great, check it out.
{% endhighlight %}

##Alternatives

If [Jekyll](https://github.com/mojombo/jekyll/) is too nerdy for you, then please checkout [tumblr](https://tumblr.com) whose philosophy has been based on link-blogging for ages.

On the otherside if [Octopress](https://octopress.org/) and therefore Ruby is still to cool for you to use then give the newly released [Second Crack](https://github.com/marcoarment/secondcrack) by [Marco Arment](https://www.marco.org) a try. It's also baking your markdown files to flat html ones, but it's written in PHP.

(Sidenote: PHP and I were never really friends)
