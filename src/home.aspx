<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="RAMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/home.css" />
    <script src="js/carousel.js"></script>
    <title></title>
</head>
<body>
    <form id="formHome" runat="server" draggable="false">
        <div>
            <div class="container-home">
      <div class="header">
        <div class="h1">
            <asp:Label ID="lblWelcome" runat="server" Text="Welcome"></asp:Label>
        </div>
      </div>
      <div class="slideshow-container">
      <div class="mySlides fade">
        <div class="numbertext">1 / 5</div>
        <img src="images/Kumba.gif" class="carousel-img" />
        <div class="text">Kumba</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">2 / 5</div>
        <img src="images/Jasmyn.gif" class="carousel-img" />
        <div class="text">Jasmyn</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">3 / 5</div>
        <img src="images/Horizon.gif" class="carousel-img" />
        <div class="text">Horizon</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">4 / 5</div>
        <img src="images/Thuthuka.gif" class="carousel-img" />
        <div class="text">Thuthuka</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">5 / 5</div>
        <img src="images/Vergelegen.gif" class="carousel-img" />
        <div class="text">Vergelegen</div>
      </div>

       <!-- Next and previous buttons -->
       <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
      <div style="text-align: center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
        <span class="dot" onclick="currentSlide(5)"></span>
      </div>
    </div>

      <div class="box box-one">
        <div>
          &nbsp;<img src="images/house.jpg" alt="" class="content-image-one"/></div>
        <div>
          <p></p>
            <asp:LinkButton ID="lbtnRoomSelect" runat="server">Room Selection</asp:LinkButton>
        </div>
      </div>
      <div class="box box-two">
        <div>
          <img src="images/cancel.jpg" alt="Cancel image" class="content-image-two"/>
        </div>
        <div>
          <p></p>
          <asp:LinkButton ID="lbtnViewCancel" runat="server">View Or Cancel</asp:LinkButton>
        </div>
      </div>
      <div class="updates">
        <h2>Updates</h2>
          <div>
              <asp:Label ID="lblDate" runat="server" Text="lblDate"></asp:Label>
              <div>
                  <asp:Label ID="Label1" runat="server" Text="lblMessage e.g Good day student, room selection will starts on monday until friday. Please follow instructions carefully and the process will be very easy.
                    The residence plan/view will be available to show the room you are applying for."></asp:Label>
              </div>
          </div>

      </div>
      <div class="footer">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAYAAAA6/NlyAAAAAXNSR0IArs4c6QAABSpJREFUaEPtmo1NG0kUx/+ztu9EdlYHFcRUEFIBpoKQCg4qOKggpIKQCgIVnFNBTAXnVHCmAkCeDZJX9js9s+aMPR9v7N3ISVgpipBn38zvvZn3Navwiz3qF+PFM/DPbvFnC1dp4fv7+/Z4PN5XSrUVUYeANh7+zT8DBQwmQB9Av9FoXG1tbQ2qXMe8rMotzJA0Hr8h4MQCJ+UYQKmLJEkuq4avDJhBJ+PxOwBHUirROKLuBPiYZVlPND4waG3gm5ub7Var9U49WLS+h6ibNJun61p8LeA8zw9B9AnAdn2kTyTfEnCqtb5Ydb6VgY0xH2q3qpvqItX6eBXolYBzY9iq1Z7V+NX3R0VxsLOzcxvzajTwN2O+ENCJmaTGsdHQUcAbYtlF/UVBi4Hz4fAMSnHY2cRHfKZFwMPhsJMo9cVBej0hOiqzqUMo9aZSjRB9Vkr1xkT9RKlzAK9s8gk4lnjvIDDH2d9arX9cWRMBH7XWjzF4Or7ZPKlgN1wmjcbZfNz9ZswJAR8cCr0dFcVuyIkFgUNb2aXZMo+exctpnkxE0xx5ljXxzuG/kyTZxmSyR0p1FNEtKXWmteZ3njyBnQYQddMse+vbYV7gMl381ydgQnRQVdoXOgpVrMcLnBvDFvpzU4DL43XjVQzR5zTLDl1jnMClcLauP21U6m2apt2Qdar4Pbily0mSRmPXlXM7gY0xRwrgjMqv0AWnFRq/zu8Bp/W/aKL3aZad2eZyAufDYVcUYr6jhY0xewrgiBF6BqnWu3HAxlBIKjyaDL674oBQ1JiJdW1rq4WFZ+VuVBTtUNxbkcv7Wm4Mh7eXvkGucGkFFmkx4A3rAJ3JNMacK+CvAPCThGg21g4sCEfSVK4OcMkOJOBKa71U1VmBjTE9BexvSvxdXIfQeVkd1w8JzArIBU411XqJ74cEFmVcAH4aYMkZ5l1QKfCmOy0A16nWi7cc9ttDidNarIPr8MYumZIUM8pLi+Iw4Ezf6oYXGkQeliQaZChfVVIXtNRhuXagy0uLknQF9F5ofVAXnE2upEafvucoatzVkjHc4P4jBPM9Ox7ChGO65FFR7Njy/PXLQ4Dvew5sPaiQsmJ+L2G5cyq5x/qaar0XVx4+XJT9LVzULZQ6rqvzUcZdXosElkPP6QutuaW79IR6Wotl2B0BffUw8VJ/mM/0mOh9VU29EpR7ajH3WN6y1Q+8fNswGBXFaz4b5RbjJp+tMc6K6hHQaxANtrLsSrJT7ofD/Qm3bIm4CceVzlLiIJBzmWrtVJAXuAwBvPh55/V4Zsvf+WbeehtQLk7UKChlcS/aW9iHgEOhMtiId8TkR+jS0gxt9ei+82Qp+0SNQye0oOUUBGbhtsxmPgb7Opyu8OBatKTsc7x7PSqKvVDLSQpsTUTmY3Bpab5j4rP3knPZBOi6vKULWJI22t6V5gMi4NLKS9utjkxrFeCYYyMGZmhbUUHAudb6NORMpL+vAOz1yovzRgFPoW0Nvoo+KXL5C4+yomCnKbZU8/PjPOVjH3wlmiT8f5uAu/m7Y8lcERaOhl0Z2HWmF4FcRbgPXAK8TrdlJQvPFsyeGQA3xa0t3RqAv06ITtZJXdcCnoGXyQnf1i0mH/1U69eSrTynRFtP/A5E564bwRj5lQDzhJwa/t5qHZVf0c7SQ2sjLWJLT0GTZvNi3W8sZ3NWBvzEqeX5IRF1+Oub2JKxPCac/PclX+XEWHctpxU70aaMr8XCmwJnW8cz8CZbp4q1PVu4Ci1usoz/AOrFvVvdzgkiAAAAAElFTkSuQmCC"/>
        <p>2021 Bio-Cloud. All rights reserved</p>
      </div>
    </div>
        </div>
    </form>
</body>
</html>
