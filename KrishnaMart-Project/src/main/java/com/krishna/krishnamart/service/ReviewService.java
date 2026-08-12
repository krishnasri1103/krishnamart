package com.krishna.krishnamart.service;

import com.krishna.krishnamart.dao.OrderDAO;
import com.krishna.krishnamart.dao.ReviewDAO;
import com.krishna.krishnamart.exception.AppException;
import com.krishna.krishnamart.exception.ConflictException;
import com.krishna.krishnamart.exception.ForbiddenException;
import com.krishna.krishnamart.exception.ValidationException;
import com.krishna.krishnamart.model.Order;
import com.krishna.krishnamart.model.Review;
import com.krishna.krishnamart.util.ValidationUtil;

import java.util.List;

/** Business rules for product reviews and star ratings on completed orders (F8). No JDBC here. */
public class ReviewService {

    private final ReviewDAO reviewDAO;
    private final OrderDAO orderDAO;

    public ReviewService(ReviewDAO reviewDAO, OrderDAO orderDAO) {
        this.reviewDAO = reviewDAO;
        this.orderDAO = orderDAO;
    }

    public Review submit(long userId, long orderId, long productId, int rating, String comment) throws AppException {
        if (!ValidationUtil.isValidRating(rating)) {
            throw new ValidationException("rating", "Rating must be between 1 and 5");
        }
        Order order = orderDAO.findById(orderId)
                .orElseThrow(() -> new ValidationException("orderId", "Order not found"));
        if (!order.getBuyerId().equals(userId)) {
            throw new ForbiddenException("You can only review your own orders");
        }
        if (order.getStatus() != Order.Status.DELIVERED) {
            throw new ConflictException("You can only review products from delivered orders");
        }
        boolean productInOrder = order.getItems().stream().anyMatch(i -> i.getProductId().equals(productId));
        if (!productInOrder) {
            throw new ValidationException("productId", "This product was not part of that order");
        }
        if (reviewDAO.existsByUserAndOrderAndProduct(userId, orderId, productId)) {
            throw new ConflictException("You already reviewed this product for this order");
        }

        Review review = new Review();
        review.setUserId(userId);
        review.setOrderId(orderId);
        review.setProductId(productId);
        review.setRating(rating);
        review.setComment(comment);
        return reviewDAO.insert(review);
    }

    public List<Review> forProduct(long productId) throws AppException {
        return reviewDAO.findByProduct(productId);
    }

    public double averageRating(long productId) throws AppException {
        return reviewDAO.averageRating(productId);
    }
}
