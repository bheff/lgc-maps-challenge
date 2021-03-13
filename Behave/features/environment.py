from selenium.webdriver import Chrome


def before_all(context):
    context.browser = Chrome()
    context.browser.maximize_window()


def after_all(context):
    context.browser.quit()
    context.browser = None
