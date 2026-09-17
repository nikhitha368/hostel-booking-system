<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="HostelBooking.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hostel Room Booking - Home</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to bottom right, #eaf5ef, #f7fafc);
            color: #333;
            margin: 0;
            padding: 0;
            line-height: 1.7;
        }

        h1, h2, h3 { color: #004d40; margin-bottom: 10px; }
        p { font-size: 16px; color: #444; }

        /* Header */
        header {
            background: #baf1d3;
            color: #004d40;
            text-align: center;
            padding: 40px 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        header h1 { font-size: 2.6rem; margin-bottom: 10px; }
        header p { font-size: 1.1rem; opacity: 0.9; }

        /* Hero */
        .hero {
            background: url('Images/WhatsApp%20Image%202025-10-12%20at%205.56.05%20PM.jpeg') no-repeat center center;
            background-size: cover;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            color: #fff;
            
        }
        .hero::after {
            content: '';
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,77,64,0.45);
            border-radius: 16px;
        }
        .hero-content {
            position: relative;
            z-index: 1;
            max-width: 700px;
            text-align: center;
        }
        .hero-content h2 { font-size: 2rem; margin-bottom: 10px; color:white;}
        .hero-content p { font-size: 1.1rem; color:azure;}

        /* Main container */
        .container {
            max-width: 1100px;
            background: #ffffff;
            margin: 40px auto;
            padding: 50px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            background-color: #baf1d3;
        }
        .container h2 { text-align: center; font-size: 1.8rem; margin-bottom: 25px; }
        .container p { text-align: justify; margin-bottom: 20px; }

        /* CTA Buttons */
        .cta-buttons {
            text-align: center;
            margin: 40px 0 20px 0;
        }
        .btn {
            padding: 14px 32px;
            border: none;
            border-radius: 10px;
            color: #fff;
            font-size: 16px;
            margin: 10px;
            cursor: pointer;
            transition: 0.3s ease;
        }
        .btn-yes { background-color: #009879; }
        .btn-no { background-color: #e53935; }
        .btn:hover { transform: scale(1.05); opacity: 0.95; }

        /* Amenities */
.amenities { 
    text-align: center; 
    margin: 60px 0; 
}

.amenities h2 { 
    margin-bottom: 25px; /* slightly reduced for compactness */
}

.amenities-cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 5px; /* reduced gap for tighter layout */
    justify-items: center;
}

.amenity-card {
    background: #f1f9f5;
    padding: 20px; /* compact padding */
    width: 100%;
    max-width: 280px;
    border-radius: 16px;
    box-shadow: 0 6px 15px rgba(0,0,0,0.08);
    transition: all 0.3s ease;
    text-align: center;
}

.amenity-card:hover { 
    transform: translateY(-6px); 
}

.amenity-card img { 
    width: 160px; /* increased from 130px */
    height: 160px; /* increased from 130px */
    margin-bottom: 10px; 
    object-fit: contain; 
}

.amenity-card h3 { 
    color: #004d40; 
    font-size: 1.25rem; 
    margin-bottom: 6px; 
}

.amenity-card p { 
    font-size: 14px; 
    color: #555; 
}



        /* Testimonials */
        .testimonials {
            background: #e6f2ed;
            padding: 60px 30px;
            text-align: center;
            border-radius: 16px;
            margin-top: 40px;
        }
        .testimonials h2 { font-size: 1.8rem; margin-bottom: 35px; }
        .testimonial {
            max-width: 700px;
            margin: 0 auto 25px auto;
            font-style: italic;
            color: #555;
            font-size: 15px;
        }
        .testimonial strong { color: #004d40; }

        /* About Us */
        .about-us { margin-top: 50px; border-top: 1px solid #ccc; padding-top: 30px; text-align: center; }
        .about-us p { max-width: 850px; margin: 0 auto 15px auto; }

        /* Footer */
        footer {
            background: #00695c; /* Slightly lighter than before */
            color: white;
            padding: 35px 20px;
            text-align: center;
            font-size: 0.95rem;
            margin-top: 60px;
            border-radius: 0 0 16px 16px;
            text-shadow: 0 1px 2px rgba(0,0,0,0.3);
        }
        footer p { margin: 5px 0; color: #ffffff; }

        /* Responsive */
        @media (max-width: 768px) {
            .hero { height: 300px; }
            .container { padding: 25px; }
        }
    </style>

    <script type="text/javascript">
        function handleRegister(choice) {
            if (choice === 'yes') {
                window.location.href = 'register.aspx';
            } else {
                alert('Thank you for visiting!');
            }
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header>
            <h1>Welcome to Ferns Nest</h1>
            <p>Comfortable stays and easy booking for students</p>
        </header>

        <!-- Hero Section -->
        <div class="hero">
            <div class="hero-content">
                <h2>Travel, Explore, and Connect</h2>
                <p>Experience comfort, community, and convenience</p>
            </div>
        </div>
        

        <!-- Main Content -->
        <div class="container">
            <h2>General Information</h2>
            <p>
                Hostel room booking helps students find comfortable accommodation near their institutions. 
                The system provides real-time availability, easy booking, and transparency. 
                Students can browse room types, compare prices, and make informed decisions. 
                Admins can monitor occupancy, approve bookings efficiently, and maintain records with ease. 
                Our platform ensures a safe and streamlined experience for both students and hostel staff.
            </p>

            <!-- Amenities Section -->
            <section class="amenities">
                <h2>Our Amenities</h2>
                <div class="amenities-cards">
                    <div class="amenity-card">
                        <img src="Images/download%20(1).jpeg" />
                        <h3>Free Wi-Fi</h3>
                        <p>High-speed internet throughout the hostel.</p>
                    </div>
                    <div class="amenity-card">
                        <img src="Images/b8db6b56-0287-445b-8119-ddae3b2171aa.jpeg" />
                        <h3>Secure Lockers</h3>
                        <p>Keep your belongings safe with individual lockers.</p>
                    </div>
                    <div class="amenity-card">
                        <img src="Images/Sustainability%20-%20San%20Domenico%20School.jpeg" />
                        <h3>Communal Kitchen</h3>
                        <p>Cook meals and socialize with other travelers.</p>
                    </div>
                    <div class="amenity-card">
                        <img src="Images/Hostel%20in%20Bangkok%20Thailand.jpeg" />
                        <h3>Common Areas</h3>
                        <p>Relax and enjoy community spaces.</p>
                    </div>
                </div>
            </section>

            <!-- CTA -->
            <h2 style="text-align:center;">Would you like to register?</h2>
            <div class="cta-buttons">
                <asp:Button ID="btnYes" runat="server" Text="Yes" CssClass="btn btn-yes" OnClick="btnYes_Click" />
                <asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn btn-no" OnClientClick="handleRegister('no'); return false;" />
            </div>

            <!-- Testimonials -->
            <section class="testimonials">
                <h2>What Our Guests Say</h2>
                <div class="testimonial">
                    "Amazing place to stay! Friendly staff and great vibe." - <strong>Alex J.</strong>
                </div>
                <div class="testimonial">
                    "Perfect location, clean rooms, and social events. Will return!" - <strong>Maria S.</strong>
                </div>
                <div class="testimonial">
                    "Felt like home away from home. Loved the communal kitchen." - <strong>Ravi K.</strong>
                </div>
            </section>

            <!-- About Us -->
            <div class="about-us">
                <h2>About Us</h2>
                <p>We provide a seamless hostel booking experience, helping students find suitable accommodations and assisting admins with efficient room management.</p>
                <p>Thank you for choosing our Hostel Room Booking System.</p>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            <p>Contact: #13/b, Absoth Nagar, 5th Main, Bengaluru-56 | Phone: 6366788701 | Email: fernsnest@gmail.com</p>
            <p>&copy; 2025 FERNS NEST. All rights reserved.</p>
        </footer>
    </form>
</body>
</html>
