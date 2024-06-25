<%-- 
    Document   : Footer
    Created on : 13 Oct, 2023, 11:31:29 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <!--<link rel="stylesheet" href="./style.css">-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer"
              />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <section id="footer" class="mt-5">
        <div class="container">
            <div class="row">
                <div class="position-relative text-center">
                    <h4 class="fw-bold mb-4">Contact</h4>
                    <p class="fs-4"><strong>Address:</strong> 562 Wellington Road Street 32, San Fransica</p>
                    <p class="fs-4"><strong>Phone:</strong> +01 2222 365 /(+91) 01 2345 6329</p>
                    <p class="fs-4"><strong>Hours:</strong> 10:00 - 18:00, Mon - Sat</p>
                    <div class="follow">
                        <h4>Follow Us</h4>
                        <div class="icons mt-5">
                            <i class="bx bxl-facebook me-2 fs-3"></i>
                            <i class="bx bxl-twitter me-2 fs-3"></i>
                            <i class="bx bxl-instagram me-2 fs-3"></i>
                            <i class="bx bxl-pinterest-alt me-2 fs-3"></i>
                            <i class="bx bxl-youtube me-2 fs-3"></i>
                        </div>
                    </div>
                    <div class="footer-logo">
                        <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODAiIGhlaWdodD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PHN5bWJvbCBpZD0iYSIgdmlld0JveD0iMCAwIDIzIDI0Ij48cGF0aCBkPSJNNS4wNzYgMTIuMDE3YzAtMy44MTQgMi4zMjgtNy41MDkgNi41MjEtNy41MDkgNC4xOTQgMCA2LjUyMiAzLjY5NSA2LjUyMiA3LjUxIDAgMTAuMDk4LTEzLjA0MyAxMC4wOTUtMTMuMDQzIDBabTE3LjkxOC03LjUyMVYuNjAzaC00Ljg3NXYxLjUxNEMxNi4xMjcuNjgzIDEzLjk2Ny4wMTMgMTEuNjMgMGgtLjAzM0wxMS41NjQgMEM4Ljc0Mi4wMTYgNi4xNzguOTg4IDMuODU3IDMuMTEgMi41OCA0LjI5MSAxLjYwNyA1LjYzNS45NjQgNy4xMTQuMzI3IDguNTg4IDAgMTAuMjM5IDAgMTIuMDE1YzAgMS42NTguMjg4IDMuMjExLjg1MyA0LjYxNi41NjYgMS40MDUgMS40MjYgMi43MDUgMi41NiAzLjg2MyAxLjEzNCAxLjE2IDIuNDAxIDIuMDQyIDMuNzY2IDIuNjIgMS4zMzYuNTY1IDIuODA3Ljg1OCA0LjM2OS44N2guMDVsLjA0OS4wMDFjMS41NjItLjAxMyAzLjAzMy0uMzA2IDQuMzY5LS44NzEuNzMtLjMxIDEuNDMzLS43MDcgMi4xMDMtMS4xODd2MS40NTVoNC44NzVWNC40OTZaIi8+PC9zeW1ib2w+PHN5bWJvbCBpZD0iYiIgdmlld0JveD0iMCAwIDU3IDI0Ij48cGF0aCBkPSJNNTAuOTY0IDE5LjMxNmMtMS4wMTggMS4wMDktMy40OTUgMS40MDUtNS4yODIuMjUxLTEuMDYtLjY4NC0xLjgwMS0xLjkxMy0xLjc5OC0zLjE5OGwtNC41NTktLjAwMmMuNDk4LTEuMzM1Ljc1LTIuNzk4Ljc1LTQuMzUyIDAtLjM0OC0uMDEyLS42OS0uMDM3LTEuMDI4LjMuMzc2LjY1MS43MjEgMS4wNTggMS4wMjIgMi40OTUgMS44MzMgNS42NSAxLjcyNiA4LjQwNSAyLjg2Ny42NDQuMjY3IDEuMjgzLjYxOSAxLjcwNSAxLjE4Ni44NiAxLjE1OS44MDYgMi4yMTUtLjI0MiAzLjI1NFptLTI5LjAwNy03LjI5OWMwLTMuODE0IDIuMzI4LTcuNTEgNi41MjEtNy41MVMzNSA4LjIwNCAzNSAxMi4wMThjMCAxMC4xLTEzLjA0MiAxMC4wOTYtMTMuMDQyIDBabS02LjEzNi0uMDAzYy0yLjQ5NS0xLjgzMy01LjY1LTEuNzI1LTguNDA1LTIuODY2LS42NDUtLjI2Ny0xLjI4NC0uNjItMS43MDUtMS4xODctLjcwMy0uOTQ2LS41OTMtMi40MjcuMjQxLTMuMjUzIDEuMDE1LTEuMDA2IDMuNDkyLTEuNDA4IDUuMjgyLS4yNTIgMS4wNi42ODUgMS44MDIgMS45MTQgMS43OTggMy4xOThsNC41OTYuMDAyYy0uNDk0IDEuMzMzLS43NDcgMi43OTgtLjc0NyA0LjM1OSAwIC4zNjMuMDE1LjcyMi4wNDIgMS4wNzVhNS42OTIgNS42OTIgMCAwIDAtMS4xMDItMS4wNzZaTS4xOTQgOS41NDhhNS43MzMgNS43MzMgMCAwIDAgMS45IDIuNDY2YzIuNDk1IDEuODMzIDUuNjUgMS43MjUgOC40MDUgMi44NjcuNjQ1LjI2NyAxLjI4NC42MTggMS43MDUgMS4xODYuNzAzLjk0Ni41OTMgMi40MjctLjI0MiAzLjI1My0xLjAxNyAxLjAxLTMuNDk1IDEuNDA2LTUuMjgxLjI1Mi0xLjA2LS42ODUtMS44MDItMS45MTMtMS43OTgtMy4xOThsLTQuNjg5LS4wMDJtMCAyLjI3OGMuNDk0IDEuMzkxIDEuMzc1IDIuNjQgMi41MzIgMy41MjYgMi4xNDkgMS42NDcgNS4wMDggMS45OCA3LjY4MyAxLjc2NSAxLjY0OC0uMTMyIDMuMzE3LS40NjQgNC43NDUtMS4zMTcgMS43ODUtMS4wNjcgMi44MzYtMy4wMiAzLjAxNi01LjA0M2ExMi4xMiAxMi4xMiAwIDAgMCAyLjEyNCAyLjkxM2MxLjEzNCAxLjE2IDIuNDAyIDIuMDQyIDMuNzY2IDIuNjIgMS4zMzYuNTY1IDIuODA3Ljg1OCA0LjM2OS44N3YuMDAxaC4wOTljMS41NjItLjAxMyAzLjAzMy0uMzA2IDQuMzY4LS44NzEgMS4zNjUtLjU3OCAyLjYzMy0xLjQ2IDMuNzY2LTIuNjJhMTIuMDc4IDEyLjA3OCAwIDAgMCAyLjIwNy0zLjA3NWMuMzM3IDEuODcyIDEuMzcgMy42MTIgMi44NTggNC43NTMgMi4xNSAxLjY0NyA1LjAwOCAxLjk4IDcuNjgzIDEuNzY1IDIuMDc4LS4xNjggMy4yNi0uNDMgNC43NDYtMS4zMTggMy42Mi0yLjE2MyA0LjIyLTcuOTc1LjY2Ni0xMC42MS0yLjQ5NS0xLjgzMi01LjY1LTEuNzI1LTguNDA1LTIuODY2LS42NDUtLjI2Ny0xLjI4NC0uNjE5LTEuNzA1LTEuMTg2LS43MDItLjk0Ny0uNTkyLTIuNDI3LjI0Mi0zLjI1NCAxLjAxNS0xLjAwNiAzLjQ5Mi0xLjQwOCA1LjI4Mi0uMjUyIDEuMDYuNjg1IDEuODAxIDEuOTE0IDEuNzk4IDMuMTk4bDUuMTMuMDAzYy0uMDg1LTIuMjU4LTEuMjA4LTQuNDUyLTIuOTczLTUuODA1QzUyLjA0LjIgNDkuMTgyLS4xMzMgNDYuNTA4LjA4MiA0NC44Ni4yMTUgNDMuMTkuNTQ3IDQxLjc2MiAxLjRjLTEuNzc4IDEuMDYyLTIuODE1IDIuOTgtMy4wMSA0Ljk3LS42MjUtMS4xODgtMS40NzMtMi4yOC0yLjUzMy0zLjI2QzMzLjg5OC45ODcgMzEuMzM0LjAxNSAyOC41MSAwaC0uMDY2Yy0yLjgyMi4wMTYtNS4zODYuOTg4LTcuNzA3IDMuMTEtMS4xNDYgMS4wNi0yLjA0NCAyLjI0OS0yLjY4MSAzLjU1LS4zMjctMS44OTMtMS4zNjUtMy42NTYtMi44NjgtNC44MDhDMTMuMDQuMjA1IDEwLjE4MS0uMTI4IDcuNTA2LjA4NyA1Ljg1OC4yMiA0LjE5LjU1IDIuNzYgMS40MDUgMS41NTIgMi4xMjcuNjg2IDMuMjQ0LjE5NCA0LjUxIi8+PC9zeW1ib2w+PHVzZSBocmVmPSIjYSIgd2lkdGg9IjIzIi8+PHVzZSBocmVmPSIjYiIgeD0iMjIuOCIgd2lkdGg9IjU3Ii8+PC9zdmc+" class="" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>
    </body>

</html>