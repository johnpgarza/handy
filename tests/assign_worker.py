import unittest
import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.select import Select


class Blog_ATS(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_blog(self):
        user = "john"
        pwd = "maverick1a"
        driver = self.driver
        driver.maximize_window()
        driver.get("http://127.0.0.1:8000")
        elem = driver.find_element_by_xpath("/html/body/nav/div/form/a[1]").click()
        elem = driver.find_element_by_id("id_username")
        elem.send_keys(user)
        elem = driver.find_element_by_id("id_password")
        elem.send_keys(pwd)
        elem.send_keys(Keys.RETURN)
        time.sleep(1)
        elem = driver.find_element_by_xpath("/html/body/div/div/div/div/div/div/div[3]/div/div/p[2]/a")
        elem.click()
        elem = driver.find_elements_by_css_selector("div[class=card-body]")[-1]
        elem.find_elements_by_tag_name('a.btn btn-primary')
        elem.find_element_by_link_text('Assign').click()
        elem = driver.find_element_by_id("id_assigned_employee")
        for option in elem.find_elements_by_tag_name('option'):
            option.click()
        elem = driver.find_element_by_xpath("/html/body/div/form/button").click()
        time.sleep(5)

        def tearDown(self):
            self.driver.close()

    if __name__ == "__main__":
        unittest.main()
