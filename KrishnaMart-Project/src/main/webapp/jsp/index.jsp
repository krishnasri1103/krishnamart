<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/jspf/header.jspf" %>

<!-- HERO -->
<section class="hero-section">
    <div class="hero-content">
        <span class="hero-badge">✨ Welcome to Krishna Sri Mart</span>
        <h1>Everything you need,<br><span>all in one place.</span></h1>
        <p>Discover electronics, fashion, home essentials and more at great prices.</p>

        <a href="#products" class="hero-button">Shop Now →</a>
    </div>

    <div class="hero-visual">
        <div class="hero-circle"></div>
        <div class="hero-card">
            <span>🛍️</span>
            <strong>Smart Shopping</strong>
            <small>Easy • Secure • Fast</small>
        </div>
    </div>
</section>

<!-- CATEGORY SHORTCUTS -->
<section class="category-section">
    <div class="section-heading">
        <div>
            <span class="section-label">EXPLORE</span>
            <h2>Shop by Category</h2>
        </div>
    </div>

    <div class="category-grid">

        <button class="category-tile electronics-tile" data-category="Electronics">
            <span class="category-icon">💻</span>
            <strong>Electronics</strong>
            <small>Gadgets & accessories</small>
        </button>

        <button class="category-tile fashion-tile" data-category="Apparel">
            <span class="category-icon">👕</span>
            <strong>Fashion</strong>
            <small>Style for everyone</small>
        </button>

        <button class="category-tile home-tile" data-category="Home">
            <span class="category-icon">🏠</span>
            <strong>Home & Living</strong>
            <small>Make your home better</small>
        </button>

        <button class="category-tile beauty-tile" data-category="">
            <span class="category-icon">✨</span>
            <strong>Beauty</strong>
            <small>Everyday essentials</small>
        </button>

    </div>
</section>

<!-- SEARCH -->
<section class="market-search">
    <div>
        <span class="section-label">FIND YOUR FAVORITES</span>
        <h2>What are you looking for?</h2>
    </div>

    <div class="search-bar">
        <input type="text" id="searchInput" placeholder="Search products...">

        <select id="categorySelect">
            <option value="">All categories</option>
            <option value="Electronics">Electronics</option>
            <option value="Apparel">Apparel</option>
            <option value="Home">Home</option>
        </select>

        <button id="searchBtn">Search</button>
    </div>
</section>

<!-- PRODUCTS -->
<section id="products" class="products-section">

    <div class="section-heading">
        <div>
            <span class="section-label">OUR COLLECTION</span>
            <h2>Popular Products</h2>
        </div>

        <span class="product-count-label">Fresh picks for you</span>
    </div>

    <section id="productGrid" class="product-grid">
        <p>Loading products...</p>
    </section>

</section>

<!-- PROMO -->
<section class="promo-section">
    <div class="promo-box promo-purple">
        <span>⚡</span>
        <div>
            <strong>Everyday Deals</strong>
            <p>Find useful products at prices you'll love.</p>
        </div>
    </div>

    <div class="promo-box promo-pink">
        <span>🛒</span>
        <div>
            <strong>Easy Shopping</strong>
            <p>Browse, add to cart and order with ease.</p>
        </div>
    </div>

    <div class="promo-box promo-blue">
        <span>🔒</span>
        <div>
            <strong>Secure Experience</strong>
            <p>Your shopping journey stays simple and safe.</p>
        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/js/api.js"></script>
<script src="${pageContext.request.contextPath}/js/products.js"></script>

<script>
document.querySelectorAll(".category-tile").forEach(function(tile) {
    tile.addEventListener("click", function() {
        const category = this.getAttribute("data-category");

        document.getElementById("categorySelect").value = category;
        document.getElementById("products").scrollIntoView({
            behavior: "smooth"
        });

        document.getElementById("searchBtn").click();
    });
});
</script>