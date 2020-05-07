import time
import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


class Blog_ATS(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_blog(self):
        user = "john"
        pwd = "maverick1a"

        # Change Worker Details
        username = "handy6"
        firstname = 'First_Name'
        lastname = 'Last_Name'
        mi = 'M'
        street = '1245 North Highway'
        city = 'Omaha'
        state = 'NE'
        zipcode = '68565'
        cell_phone = '402-555-8989'
        work_phone = '402-5656'
        specialty = "Mason"
        # END Change Worker Details

        driver = self.driver
        driver.maximize_window()
        driver.get("http://127.0.0.1:8000/admin")
        elem = driver.find_element_by_id("id_username")
        elem.send_keys(user)
        elem = driver.find_element_by_id("id_password")
        elem.send_keys(pwd)
        elem = driver.find_element_by_xpath("/html/body/div/div[2]/div/form/div[3]/input").click()
        time.sleep(1)
        elem = driver.find_element_by_xpath("/html/body/div/div[2]/div[1]/div[2]/table/tbody/tr/td[1]/a").click()
        time.sleep(2)
        elem = driver.find_element_by_name('username').send_keys(username)
        elem = driver.find_element_by_name('first_name').send_keys(firstname)
        elem = driver.find_element_by_name('last_name').send_keys(lastname)
        elem = driver.find_element_by_name('mi').send_keys(mi)
        elem = driver.find_element_by_name('street').send_keys(street)
        elem = driver.find_element_by_name('city').send_keys(city)
        elem = driver.find_element_by_name('state').send_keys(state)
        elem = driver.find_element_by_name('zip').send_keys(zipcode)
        elem = driver.find_element_by_name('cell_phone_0').send_keys(cell_phone)
        elem = driver.find_element_by_name('work_phone_0').send_keys(work_phone)
        elem = driver.find_element_by_id("id_specialty")
        for option in elem.find_elements_by_tag_name('option'):
            if option.text == specialty:
                option.click()
        elem = driver.find_element_by_name('_save').click()

        time.sleep(5)

    def tearDown(self):
        self.driver.close()


if __name__ == "__main__":
    unittest.main()
