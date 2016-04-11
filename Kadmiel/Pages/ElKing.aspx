<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ElKing.aspx.cs" Inherits="Prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <div id="wrap">
            <header class="visible">
                <a href="index.html" id="logo">El King</a>

                <div id="menu">
                    <ul id="nav">
                        <li><a href="index.html" class="external">Inicio</a></li>
                        <li class="current"><a href="#contact">Contacto</a></li>
                    </ul>
                </div>
            </header>

            <!-- Start Contact Section -->
            <section class="content clearfix" id="contact">
                <div class="container clearfix">
                    <div class="sixteen columns">
                        <div class="section_title clearfix">
                            <h2>Contactanos</h2>
                            <h4><span class="color">//</span>Cerca de area metropolitana y en la capital del estado</h4>
                        </div>

                        <div class="contact_desc margin-20 clearfix">
                            <p class="nomargin">
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sed ligula odio. Sed id metus felis. Ut pretium nisl non justo condimentum id tincidunt nunc faucibus. Ut neque eros, pulvinar eu blandit quis, lacinia nec ipsum. Etiam vel orci ipsum. Sed eget velit ipsum. Duis in tortor scelerisque felis mattis imperdiet. Donec at <a href="#">libero tellus</a>. Suspendisse consectetur consectetur bibendum. Pellentesque posuere, ligula volutpat elementum interdum, diam arcu elementum ipsum, vel ultricies est mauris ut nisi.
                   
                            </p>
                        </div>

                        <div class="sep height-55-bottom clearfix"></div>

                        <!-- Start Map Area -->
                        <div class="map_area">
                            <div class="map-btn btn-animated rounded bgcolor margin-20">
                                <span class="icon-map-marker-2 icon-white"></span>
                                <a href="#" id="map_trigger">Mostrar Mapa</a>
                            </div>

                            <div class="map row" style="height: 400px" id="map_1" aria-selected="true" data-maplat="20.111125" data-maplon="-98.774075" data-mapzoom="15" data-maptitle="Aquí estamos!"></div>

                        </div>
                        <!-- End Map Area -->

                        <div class="sep height-55-top clearfix"></div>

                        <!-- Start Contact Area -->
                        <div class="contact_form_area clearfix">

                            <!-- Start Contact Form -->
                            <div class="two-thirds column alpha">
                                <h5 class="margin-15">Permitenos estar en contacto</h5>
                                <form class="contact_form" action="#" id="contact_form">
                                    <fieldset>
                                        <input type="text" name="name" value="" id="contact_name" placeholder="Tu Nombre*" />
                                    </fieldset>

                                    <fieldset>
                                        <input type="text" name="email" value="" id="contact_email" placeholder="Tu Email*" />
                                    </fieldset>

                                    <fieldset class="last clearfix">
                                        <input type="text" name="subject" value="" id="contact_subject" placeholder="Tu asunto" />
                                    </fieldset>

                                    <fieldset class="full clearfix">
                                        <textarea name="message" id="contact_message" placeholder="Tu Mensaje*"></textarea>
                                    </fieldset>

                                    <a href="~/php/contact.php" id="contact_form_submitter" class="button b-radius bgcolor">Enviar Mensage</a>

                                    <div id="contact_response">
                                    </div>
                                </form>
                            </div>
                            <!-- End Contact Form -->


                            <!-- Start Contact Info Box -->
                            <div class="one-third column omega">
                                <h5>Información de Contacto </h5>
                                <p>
                                    Nos podrá localizar en cualquiera de nuestros centros de servicio, en un horario de 9:00 a 18:00 HRS. de Lunes a Viernes y Sábados de 9:00 a 15:00 HRS.  
                       
                                </p>
                                <p>
                                    Carretera México Pachuca Km. 52<br />
                                    Tizayuca, Hgo. C.P 43800<br />
                                    México
                       
                                </p>
                                <p>
                                    <strong>Teléfono:</strong> (779) 100-7664<br />
                                    <strong>Fax:</strong> (779) 100-7664<br />
                                    <strong>Email:</strong> <a href="#">contacto@verificentrosdehidalgo.com</a><br />
                                    <strong>Web:</strong> <a href="#">verificentrosdehidalgo.com</a>
                                </p>
                            </div>
                            <!-- End Contact Info Box -->


                        </div>
                        <!-- End Contact Area -->


                        <!-- Start Footer -->
                        <footer>
                            <div class="container clearfix">
                                <div class="sixteen columns">
                                    &copy; 2012 DRACO. All Rights Reserved. <a href="#" target="_blank">Draco Template</a> by <a href="http://www.starsthemes.com" target="_blank">StarsThemes</a>.
            
           
                                </div>
                            </div>
                        </footer>
                        <!-- End Footer -->
                    </div>
                </div>
            </section>
        </div>
</asp:Content>

