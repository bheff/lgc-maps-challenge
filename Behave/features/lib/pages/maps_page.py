from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


class MapsPage(object):
    locator_dictionary = {
        "cookies_iframe": (By.XPATH, '//*[@id="consent-bump"]//*/iframe'),
        "cookie_consent": (By.ID, 'introAgreeButton'),
        "search_input": (By.ID, 'searchboxinput'),
        "search_icon": (By.ID, 'searchbox-searchbutton'),
        "panel_heading": (By.XPATH, '//*[@id="pane"]//*/h1'),
        "directions_icon": (By.XPATH, '//*[@id="pane"]//*/button[@data-value="Directions"]'),
        "directions_input": (By.XPATH, '//*[@id="directions-searchbox-1"]//*/input')
    }

    def __init__(self, context):
        self.browser = context.browser
        self.timeout = 30

    def visit(self, url):
        self.browser.get(url)

    def find_element(self, *loc):
        return self.browser.find_element(*loc)

    def wait_for_element(self, elem):
        WebDriverWait(self.browser, self.timeout).until(
            EC.visibility_of_element_located(self.locator_dictionary[elem])
        )

    def consent_to_cookies(self):
        iframe = self.find_element(*self.locator_dictionary['cookies_iframe'])
        self.browser.switch_to.frame(iframe)
        self.find_element(*self.locator_dictionary['cookie_consent']).click()

    def input_search(self, location):
        self.find_element(*self.locator_dictionary['search_input']).send_keys(location)

    def click_search_icon(self):
        self.find_element(*self.locator_dictionary['search_icon']).click()

    def verify_panel_heading(self, location):
        self.wait_for_element('panel_heading')
        ui_heading = self.find_element(*self.locator_dictionary['panel_heading']).text
        assert ui_heading == location

    def click_directions_icon(self):
        self.find_element(*self.locator_dictionary['directions_icon']).click()

    def verify_destination_field(self, location):
        self.wait_for_element('directions_input')
        ui_text = self.find_element(*self.locator_dictionary['directions_input']).get_attribute('aria-label')
        ui_text = ui_text.split()[1]
        assert ui_text == location
