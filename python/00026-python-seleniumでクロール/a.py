import time
from selenium import webdriver

root_url='https://qiita.com/ukijumotahaneniarukenia/lgtms?page='

min_page=1

#max_page=33
max_page=2

driver = webdriver.Chrome()

#略称形式はNG
xpath='/html/body/div[1]/div[3]/div/div[2]/div/div/div[3]/div'

page_info=[]

for page in range(min_page,max_page+1):

    output_file_name=str(page)+".tsv"

    driver.get(root_url+str(page))

    time.sleep(5)

    elements=driver.find_elements_by_xpath(xpath)

    for element in elements:

        title_name=element.find_element_by_xpath('.//div[2]/a[2]').text

        url=element.find_element_by_xpath('.//div[2]/a[2]').get_attribute("href")

        updated_time=element.find_element_by_xpath('.//div[3]/div[3]').text

        tag_name_list=element.find_elements_by_xpath('.//div[1]')

        tag_text=""
        author_text=""
        for tag_name in tag_name_list:

            anchor_tag_list=tag_name.find_elements_by_xpath('.//a')

            for anchor_tag in anchor_tag_list:

                tag_text=tag_text+","+anchor_tag.text

            author_text=tag_text[tag_text.rfind(",")+1:]
            tag_text=tag_text.rstrip(","+author_text+",").lstrip(",")

        page_info.append((title_name,url,updated_time,tag_text,author_text))

    with open(output_file_name, mode='w') as f:
        for line in page_info:
            print("\t".join(line))
            f.write("\t".join(line))
            f.write("\n")

driver.quit()
