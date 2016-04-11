<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="LaPlata.aspx.cs" Inherits="LaPlata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
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
        <section class="well" style="margin: 0px;">
            <div class="row">
                <div class="col-xs-12">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- Prueba Uno -->
                    <ins class="adsbygoogle"
                        style="display: block"
                        data-ad-client="ca-pub-7945717682890660"
                        data-ad-slot="9835980630"
                        data-ad-format="auto"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>
            </div>
        </section>
        <!-- Start Contact Section -->
        <section class="content clearfix" id="contact">
            <div class="container clearfix">
                <div class="sixteen columns">
                    <div class="section_title clearfix">
                        <h2>Contactanos</h2>
                        <h4><span class="color">//</span>Ubicado en el Fraccionamiento Real de la Plata, atras de la Plaza de Toros, en el cual podras obtener cualquiera de los hologramas para vehículos a Gasolína.</h4>
                    </div>

                    <div class="contact_desc margin-20 clearfix">
                        <p class="nomargin">
                        </p>
                    </div>

                    <div class="sep height-55-bottom clearfix"></div>

                    <!-- Start Map Area -->
                    <div class="map_area">
                        <div class="map-btn btn-animated rounded bgcolor margin-20">
                            <span class="icon-map-marker-2 icon-white"></span>
                            <a href="#" id="map_trigger">Mostrar Mapa</a>
                        </div>

                        <div class="map row" style="height: 400px" id="map_1" aria-selected="true" data-maplat="20.067841" data-maplon="-98.770264" data-mapzoom="15" data-maptitle="Aquí estamos!"></div>

                    </div>
                    <!-- End Map Area -->

                    <div class="sep height-55-top clearfix"></div>

                    <!-- Start Contact Area -->
                    <div class="contact_form_area clearfix">

                        <%--  <!-- Start Contact Form -->
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
                            </div>--%>
                        <!-- End Contact Form -->


                        <!-- Start Contact Info Box -->
                        <div class="one-third column omega">
                            <h5>Información de Contacto </h5>
                            <p>
                                Nos podrá localizar en cualquiera de nuestros centros de servicio, en un horario de 9:00 a 18:00 HRS. de Lunes a Viernes y Sábados de 9:00 a 14:00 HRS.  
                       
                            </p>
                            <p>
                                Blvd. Real de la Plata, Real de la Plata<br />
                                Pachuca de Soto, Hgo. C.P 42080<br />
                                México
                       
                            </p>
                            <p>
                                <strong>Teléfono:</strong> (771) 133-3561<br />
                                <strong>Email:</strong> <a href="#">opinion@verificentrosdehidalgo.com</a><br />
                                <strong>Web:</strong> <a href="#">verificentrosdehidalgo.com</a>
                            </p>
                            <p style="text-align: center">
                                <img src="images/qrcode28.png" width="200px" />
                            </p>
                        </div>
                        <!-- End Contact Info Box -->
                    </div>
                    <!-- End Contact Area -->
                </div>
            </div>
        </section>
    </div>
</asp:Content>

