<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../../../partials/head.jsp"/>

<h4>13. Use embedded signing from a template with an added document</h4>
<c:if test="${templateOk}">
    <p>This example sends an envelope based on a template.</p>
    <p>In addition to the template's document(s), the example adds an
        additional document to the envelope by using the
        <a target='_blank' rel="noopener noreferrer" 
           href='https://developers.docusign.com/docs/esign-rest-api/esign101/concepts/templates/composite/'>Composite
            Templates</a>
        feature.</p>
    <p>In this example, the additional document is an HTML document that
        includes order details with information from the form below.</p>
    <p>This example then enables you to sign the envelope using embedded signing.</p>
    <p>Embedded signing provides a smoother user experience for a signer who is
        already logged into your web application since the DocuSign
        signing is initiated from your website.</p>
</c:if>

<c:if test="${showDoc}">
    <p><a target='_blank' href='${documentation}'>Documentation</a> about this example.</p>
</c:if>


<p>API methods used:
    <a target='_blank' rel="noopener noreferrer" href="https://developers.docusign.com/docs/esign-rest-api/reference/envelopes/envelopes/create/">Envelopes::create</a>
    and
    <a target='_blank' rel="noopener noreferrer"
       href="https://developers.docusign.com/docs/esign-rest-api/reference/envelopes/envelopeviews/createrecipient/">EnvelopeViews::createRecipient</a>.
</p>
<p>
    View source file <a target="_blank" href="${sourceUrl}">${sourceFile}</a> on GitHub.
</p>
<c:choose>
    <c:when test="${templateOk}">
        <p>The template you created via example 8 will be used.</p>

        <form class="eg" action="" method="post" data-busy="form">
            <div class="form-group">
                <label for="signerEmail">Signer Email</label>
                <input type="email" class="form-control" id="signerEmail" name="signerEmail"
                       aria-describedby="emailHelp" placeholder="pat@example.com" required
                       value="${locals.dsConfig.signerEmail}">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.
                </small>
            </div>
            <div class="form-group">
                <label for="signerName">Signer Name</label>
                <input type="text" class="form-control" id="signerName" placeholder="Pat Johnson" name="signerName"
                       value="${locals.dsConfig.signerName}" required>
            </div>
            <div class="form-group">
                <label for="ccEmail">CC Email</label>
                <input type="email" class="form-control" id="ccEmail" name="ccEmail"
                       aria-describedby="emailHelp" placeholder="pat@example.com" required>
                <small id="emailHelp" class="form-text text-muted">The email and/or name for the cc recipient must be
                    different
                    from the signer.
                </small>
            </div>
            <div class="form-group">
                <label for="ccName">CC Name</label>
                <input type="text" class="form-control" id="ccName" placeholder="Pat Johnson" name="ccName"
                       required>
            </div>
            <p>
            <hr class='styled'/>
            </p>
            <div class="form-group">
                <label for="item">Item</label>
                <select id="item" name="item" class="form-control">
                    <option>Apples</option>
                    <option selected>Avocados</option>
                    <option>Oranges</option>
                </select>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <select id="quantity" name="quantity" class="form-control">
                    <option>10</option>
                    <option selected>20</option>
                    <option>30</option>
                    <option>40</option>
                    <option>50</option>
                    <option>60</option>
                    <option>70</option>
                    <option>80</option>
                    <option>90</option>
                    <option>100</option>
                </select>
            </div>
            <input type="hidden" name="_csrf" value="${csrfToken}">
            <button type="submit" class="btn btn-docu">Submit</button>
        </form>
    </c:when>
    <c:otherwise>
        <p>Problem: please first create the template using <a href="eg008">example 8.</a> <br/>
            Thank you.</p>

        <form class="eg" action="eg008" method="get">
            <button type="submit" class="btn btn-docu">Continue</button>
        </form>
    </c:otherwise>
</c:choose>


<jsp:include page="../../../partials/foot.jsp"/>
