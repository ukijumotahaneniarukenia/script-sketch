import numpy
import cv2


img = cv2.imread("test.png")
img2 = cv2.imread("test.png",0)#グレースケールで読み込み

cv2.imshow("color",img)
cv2.imshow("gray",img2)
cv2.waitKey(0)
cv2.destroyAllWindows()
