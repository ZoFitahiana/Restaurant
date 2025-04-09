package edu.hei.school.restaurant.mapper.rest;

import edu.hei.school.restaurant.repository.IngredientCrudOperations;
import edu.hei.school.restaurant.dtos.requests.CreateOrUpdateIngredient;
import edu.hei.school.restaurant.dtos.responses.IngredientRest;
import edu.hei.school.restaurant.dtos.responses.PriceRest;
import edu.hei.school.restaurant.dtos.responses.StockMovementRest;
import edu.hei.school.restaurant.model.Ingredient;
import edu.hei.school.restaurant.exception.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class IngredientRestMapper {
    @Autowired private PriceRestMapper priceRestMapper;
    @Autowired private StockMovementRestMapper stockMovementRestMapper;
    @Autowired private IngredientCrudOperations ingredientCrudOperations;

    public IngredientRest toRest(Ingredient ingredient) {
        List<PriceRest> prices = ingredient.getPrices().stream()
                .map(price -> priceRestMapper.apply(price)).toList();
        List<StockMovementRest> stockMovementRests = ingredient.getStockMovements().stream()
                .map(stockMovement -> stockMovementRestMapper.apply(stockMovement))
                .toList();
        return new IngredientRest(ingredient.getId(), ingredient.getName(), prices, stockMovementRests);
    }

    public Ingredient toModel(CreateOrUpdateIngredient newIngredient) {
        Ingredient ingredient = new Ingredient();
        ingredient.setId(newIngredient.getId());
        ingredient.setName(newIngredient.getName());
        try {
            Ingredient existingIngredient = ingredientCrudOperations.findById(newIngredient.getId());
            ingredient.addPrices(existingIngredient.getPrices());
            ingredient.addStockMovements(existingIngredient.getStockMovements());
        } catch (NotFoundException e) {
            ingredient.addPrices(new ArrayList<>());
            ingredient.addStockMovements(new ArrayList<>());
        }
        return ingredient;
    }
}
