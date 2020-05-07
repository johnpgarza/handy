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
        elem = driver.find_element_by_xpath("/html/body/div/div/div/div/div/div/div[2]/div/div/p[2]/a").click()
        elem = driver.find_element_by_id("id_location")
        for option in elem.find_elements_by_tag_name('option'):
            if option.text == 'Interior':
                option.click()
        elem = driver.find_element_by_id("id_type")
        for option in elem.find_elements_by_tag_name('option'):
            if option.text == 'Floors':
                option.click()
        elem = driver.find_element_by_id("id_problem")
        elem.send_keys("Master bedroom carpet is pealing up.")
        time.sleep(2)
        elem = driver.find_element_by_xpath("/html/body/div/form/button").click()
        time.sleep(1)
        elem = driver.find_element_by_xpath("/html/body/div/div[1]/div/a").click()
        time.sleep(1)
        elem = driver.find_element_by_xpath("/html/body/div/div/div/a").click()
        elem = driver.find_element_by_id("id_ticket")
        for option in elem.find_elements_by_tag_name('option'):
            option.click()
        elem = driver.find_element_by_id("id_status")
        for option in elem.find_elements_by_tag_name('option'):
            if option == 'Queue':
                option.click()
        elem = driver.find_element_by_id("id_reason")
        elem.send_keys("Ticket Was Created")
        time.sleep(2)
        elem = driver.find_element_by_xpath("/html/body/div/form/button")
        elem.click()
        time.sleep(5)

        def tearDown(self):
            self.driver.close()

    if __name__ == "__main__":
        unittest.main()
