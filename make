import re
from bs4 import BeautifulSoup

# Пример HTML-документа
html_doc = """
<html>
<body>
...
UNIs/USD-Happycoin.club - Одна из самых популярных децентрализованных криптобирж зафиксировала резкий рост числа транзакций. К середине 2024 года Uniswap [/crypto/uniswap/unis-usd] обработала более 300 млн переводов. Это значительно больше 180 млн операций, проведённых за такой же период прошлого года. Для сравнения, в 2021 году через площадку прошло всего 50 млн транзакций.

Рост показателя связывают сразу с несколькими факторами. Прежде всего, с внедрением новых функций после запуска обновления Uniswap V4. К примеру, благодаря концентрированной ликвидности теперь пользователи могут получать более высокую доходность от своих активов.
...
</body>
</html>
"""

# Создаем объект BeautifulSoup
soup = BeautifulSoup(html_doc, 'html.parser')

# Находим текст после строки "UNIs/USD-"
text = soup.get_text()
match = re.search(r'UNIs/USD-(.*?)\n\n', text, re.DOTALL)

if match:
    paragraphs = match.group(1).strip().split('\n\n')
    first_two_paragraphs = paragraphs[:2]
    print("\n\n".join(first_two_paragraphs))
else:
    print("Строка 'UNIs/USD-' не найдена.")
