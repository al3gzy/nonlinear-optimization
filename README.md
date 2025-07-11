# Nonlinear Optimization 

### (I) Unconstrained Optimization

#### Functions:
- `f₁(x, y) = 1 / (1 + x² + y²)`
- `f₂(x, y) = (x²-y²) / (1 + x² + y²)`
- `f₃(x, y) = (xy) / (x² + y² + 1)`

#### Goals:
- Find all stationary points and analyze the definiteness of the Hessian.
- Identify local minima, maxima and saddle points.
- Implement and compare optimization methods: Gradient Descent, Newton’s Method, Inexact Newton Method and Quasi-Newton (BFGS)
- Plot: Gradient norm vs iteration, 3D surface plots, Contour plots with method iteration paths

---

### (II) Constrained Optimization

#### Constraint Sets:
- `S₁ = { (x, y) ∈ ℝ² : -1 ≤ x ≤ 1, -1 ≤ y ≤ 1 }`  (box constraint)
- `S₂ = { (x, y) ∈ ℝ² : x + 2y = 0 }`  (linear equality constraint)

#### Goals:
- Solve the KKT system for each function and constraint set.
- Implement the Projected Gradient Method for box-constrained problems.
- Visualize feasible regions and optimization paths.

---

### (III) Nonlinear Least Squares

#### Model:
- `g(x₁, x₂; t) = x₁ * sin(x₂ * t)`

#### Data Points:
```text
(tᵢ, yᵢ): (1,   0.8), (2,   1.5), (3,   0.9), (4,  -0.7), (5,  -1.9)
