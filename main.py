"""
Use this to render an HTML and PDF from a markdown file.
"""

import os
from pathlib import Path
from markdown_it import MarkdownIt
from weasyprint import HTML
from weasyprint.text.fonts import FontConfiguration

source_file = os.getenv('SOURCE_FILE', 'readme.md')
output_html = os.getenv('OUTPUT_HTML', 'readme.html')
output_pdf = os.getenv('OUTPUT_PDF', 'readme.pdf')
assets_path = os.getenv('ASSETS_PATH', 'assets/partials')

open_article_path = assets_path + '/open_article.html'
close_article_path = assets_path + '/close_article.html'

md = MarkdownIt("gfm-like")

text = Path(source_file).read_text()

tokens = md.parse(text)
html_text = md.render(text)
open_article = Path(open_article_path).read_text()
close_article = Path(close_article_path).read_text()
html = open_article + html_text + close_article
Path(output_html).write_text(html)

font_config = FontConfiguration()
html = HTML(string=html)

html.write_pdf(output_pdf)
