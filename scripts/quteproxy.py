import sys

qute = c
download_location = '~/Downloads'

config.load_autoconfig()

if len(sys.argv) < 4:
    print('provide a proxy')
    exit()

settings = {
    # url based settings
    'url.start_pages': ['https://google.com/'],
    'url.searchengines': {
        'DEFAULT': 'https://www.google.com/search?hl=en&q={}',
        'ddg': 'https://duckduckgo.com/?q={}',
        'sub': 'https://opensubtitle.info/search?q={}',
        'gh': 'https://github.com/search?q={}',
        'yt': 'https://youtube.com/results?search_query={}'
    },

    # reduce fingerprinting with most common user agent
    'content.headers.user_agent': ('Mozilla/5.0 (Windows NT 10.0; Win64; x64) '
                                   'AppleWebKit/537.36 (KHTML, like Gecko) '
                                   'Chrome/58.0.3029.110 Safari/537.36'),
    'content.headers.accept_language': 'en-US,en;q=0.5',
    'content.headers.custom': {
        "accept": ('text/html,application/xhtml+xml,'
                   'application/xml;q=0.9,*/*;q=0.8')
    },
    #  'content.proxy': 'socks://125.99.120.166:53826/',
    # shortcuts for frequently used commands
    'content.proxy': sys.argv[3],
    # download_location
    'downloads.location.directory': download_location,
    'editor.command': ['kitty', '-e', 'nvim', '{}'],
    'editor.encoding': 'utf-8'
}


for setting, value in settings.items():
    setattr(qute, setting, value)

