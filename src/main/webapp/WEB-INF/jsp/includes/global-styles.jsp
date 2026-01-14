<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    /* ========== STYLES GLOBAUX ========== */

    /* Tables & Lists Styles */
    .data-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .data-table thead {
        background: #f3f4f6;
        border-bottom: 2px solid #e5e7eb;
    }

    .data-table thead th {
        padding: 15px;
        text-align: left;
        font-weight: 600;
        color: #374151;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .data-table tbody tr {
        border-bottom: 1px solid #e5e7eb;
        transition: background-color 0.2s ease;
    }

    .data-table tbody tr:hover {
        background-color: #f9fafb;
    }

    .data-table tbody td {
        padding: 15px;
        color: #374151;
        font-size: 14px;
    }

    .data-table tbody tr:last-child {
        border-bottom: none;
    }

    /* Empty State */
    .empty-state {
        text-align: center;
        padding: 60px 20px;
        background: #f9fafb;
        border-radius: 12px;
        margin-top: 20px;
    }

    .empty-state-icon {
        font-size: 48px;
        color: #d1d5db;
        margin-bottom: 15px;
    }

    .empty-state-title {
        font-size: 18px;
        font-weight: 600;
        color: #374151;
        margin-bottom: 8px;
    }

    .empty-state-text {
        color: #6b7280;
        font-size: 14px;
        margin-bottom: 20px;
    }

    /* Filter/Search Section */
    .filter-section {
        background: white;
        padding: 20px;
        border-radius: 12px;
        margin-bottom: 20px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        border: 1px solid #e5e7eb;
    }

    .filter-section-title {
        font-size: 16px;
        font-weight: 600;
        color: #1f2937;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .filter-group {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 15px;
        margin-bottom: 15px;
    }

    .filter-group:last-child {
        margin-bottom: 0;
    }

    .filter-item {
        display: flex;
        flex-direction: column;
    }

    .filter-label {
        font-weight: 600;
        color: #374151;
        margin-bottom: 6px;
        font-size: 13px;
    }

    .filter-input,
    .filter-select {
        padding: 10px 12px;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        font-size: 14px;
        transition: all 0.2s ease;
        background: white;
        color: #1f2937;
    }

    .filter-input:focus,
    .filter-select:focus {
        outline: none;
        border-color: #4299e1;
        box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.1);
    }

    .filter-actions {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }

    .btn-filter,
    .btn-reset {
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
    }

    .btn-filter {
        background: #4299e1;
        color: white;
    }

    .btn-filter:hover {
        background: #3182ce;
        box-shadow: 0 2px 8px rgba(66, 153, 225, 0.3);
    }

    .btn-reset {
        background: #e2e8f0;
        color: #4b5563;
    }

    .btn-reset:hover {
        background: #cbd5e0;
    }

    /* Table Actions */
    .table-actions {
        display: flex;
        gap: 8px;
    }

    .btn-action {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 6px 12px;
        border: none;
        border-radius: 6px;
        font-size: 12px;
        cursor: pointer;
        transition: all 0.2s ease;
        text-decoration: none;
        gap: 4px;
    }

    .btn-view {
        background: #dbeafe;
        color: #0c63e4;
    }

    .btn-view:hover {
        background: #bfdbfe;
    }

    .btn-edit {
        background: #fef3c7;
        color: #b45309;
    }

    .btn-edit:hover {
        background: #fde68a;
    }

    .btn-delete {
        background: #fee2e2;
        color: #dc2626;
    }

    .btn-delete:hover {
        background: #fecaca;
    }

    /* List Header Section */
    .list-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        flex-wrap: wrap;
        gap: 15px;
    }

    .list-title {
        font-size: 20px;
        font-weight: 700;
        color: #1f2937;
    }

    .list-actions {
        display: flex;
        gap: 10px;
    }

    /* ========== FORM STYLES ========== */

    .form-container {
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        max-width: 800px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group:last-child {
        margin-bottom: 0;
    }

    .form-label {
        display: block;
        font-weight: 600;
        color: #374151;
        margin-bottom: 8px;
        font-size: 14px;
    }

    .form-label.required::after {
        content: ' *';
        color: #dc2626;
    }

    .form-input,
    .form-textarea,
    .form-select {
        width: 100%;
        padding: 12px 14px;
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        font-size: 14px;
        font-family: inherit;
        transition: all 0.2s ease;
        background: white;
        color: #1f2937;
    }

    .form-input:focus,
    .form-textarea:focus,
    .form-select:focus {
        outline: none;
        border-color: #4299e1;
        box-shadow: 0 0 0 3px rgba(66, 153, 225, 0.1);
    }

    .form-textarea {
        resize: vertical;
        min-height: 120px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .form-input::placeholder {
        color: #9ca3af;
    }

    /* Form Row (for side-by-side fields) */
    .form-row {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        margin-bottom: 20px;
    }

    .form-group-row {
        margin-bottom: 0;
    }

    /* Input Help Text */
    .form-help {
        display: block;
        margin-top: 5px;
        font-size: 12px;
        color: #6b7280;
    }

    /* Form Validation States */
    .form-input.is-invalid,
    .form-textarea.is-invalid,
    .form-select.is-invalid {
        border-color: #dc2626;
        background-color: #fef2f2;
    }

    .form-input.is-valid,
    .form-textarea.is-valid,
    .form-select.is-valid {
        border-color: #10b981;
        background-color: #f0fdf4;
    }

    .form-error {
        display: block;
        margin-top: 6px;
        color: #dc2626;
        font-size: 13px;
        font-weight: 500;
    }

    .form-success {
        display: block;
        margin-top: 6px;
        color: #10b981;
        font-size: 13px;
        font-weight: 500;
    }

    /* Form Actions */
    .form-actions {
        display: flex;
        gap: 10px;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #e5e7eb;
        flex-wrap: wrap;
    }

    .form-actions-primary {
        margin-left: auto;
    }

    /* Primary Button */
    .btn-primary {
        padding: 12px 28px;
        background: #4299e1;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .btn-primary:hover {
        background: #3182ce;
        box-shadow: 0 4px 12px rgba(66, 153, 225, 0.3);
    }

    .btn-primary:active {
        transform: translateY(-1px);
    }

    /* Secondary Button */
    .btn-secondary {
        padding: 12px 28px;
        background: #e2e8f0;
        color: #4b5563;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .btn-secondary:hover {
        background: #cbd5e0;
    }

    /* Danger Button */
    .btn-danger {
        padding: 12px 28px;
        background: #dc2626;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .btn-danger:hover {
        background: #b91c1c;
        box-shadow: 0 4px 12px rgba(220, 38, 38, 0.3);
    }

    /* Success Button */
    .btn-success {
        padding: 12px 28px;
        background: #10b981;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.2s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .btn-success:hover {
        background: #059669;
        box-shadow: 0 4px 12px rgba(16, 185, 137, 0.3);
    }

    /* Alerts/Messages */
    .alert {
        padding: 15px 16px;
        border-radius: 8px;
        margin-bottom: 20px;
        display: flex;
        align-items: flex-start;
        gap: 12px;
        border-left: 4px solid;
    }

    .alert-success {
        background: #f0fdf4;
        border-left-color: #10b981;
        color: #065f46;
    }

    .alert-danger {
        background: #fef2f2;
        border-left-color: #dc2626;
        color: #7f1d1d;
    }

    .alert-warning {
        background: #fffbeb;
        border-left-color: #f59e0b;
        color: #78350f;
    }

    .alert-info {
        background: #eff6ff;
        border-left-color: #4299e1;
        color: #1e40af;
    }

    .alert-icon {
        font-size: 18px;
        flex-shrink: 0;
        margin-top: 2px;
    }

    .alert-content {
        flex: 1;
    }

    .alert-title {
        font-weight: 600;
        margin-bottom: 4px;
    }

    .alert-message {
        font-size: 14px;
    }

    /* Pagination */
    .pagination {
        display: flex;
        gap: 5px;
        margin-top: 20px;
        justify-content: center;
        align-items: center;
    }

    .pagination-item {
        padding: 8px 12px;
        border: 1px solid #e5e7eb;
        border-radius: 6px;
        cursor: pointer;
        transition: all 0.2s ease;
        font-size: 13px;
        min-width: 36px;
        text-align: center;
    }

    .pagination-item:hover {
        border-color: #4299e1;
        color: #4299e1;
    }

    .pagination-item.active {
        background: #4299e1;
        color: white;
        border-color: #4299e1;
    }

    .pagination-item.disabled {
        color: #d1d5db;
        cursor: not-allowed;
    }

    /* Checkbox & Radio */
    .form-checkbox,
    .form-radio {
        width: 18px;
        height: 18px;
        cursor: pointer;
        accent-color: #4299e1;
    }

    .checkbox-label,
    .radio-label {
        display: flex;
        align-items: center;
        gap: 8px;
        cursor: pointer;
        font-size: 14px;
        color: #374151;
    }

    /* Select Box Customization */
    .form-select {
        cursor: pointer;
        appearance: none;
        background-image: url('data:image/svg+xml;charset=UTF-8,%3csvg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 16 16%22%3e%3cpath fill=%22%234b5563%22 d=%22M8 10.5L3.5 6h9z%22/%3e%3c/svg%3e');
        background-repeat: no-repeat;
        background-position: right 10px center;
        background-size: 16px;
        padding-right: 35px;
    }

    /* Breadcrumb */
    .breadcrumb {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 20px;
        font-size: 14px;
    }

    .breadcrumb-item {
        color: #6b7280;
        text-decoration: none;
    }

    .breadcrumb-item:hover {
        color: #4299e1;
    }

    .breadcrumb-separator {
        color: #d1d5db;
    }

    .breadcrumb-item.active {
        color: #1f2937;
        font-weight: 600;
    }

    /* Responsive Tables */
    @media (max-width: 768px) {
        .filter-group {
            grid-template-columns: 1fr;
        }

        .data-table {
            font-size: 12px;
        }

        .data-table thead th,
        .data-table tbody td {
            padding: 10px;
        }

        .form-row {
            grid-template-columns: 1fr;
        }

        .list-header {
            flex-direction: column;
            align-items: flex-start;
        }

        .table-actions {
            flex-direction: column;
        }

        .btn-action {
            width: 100%;
            justify-content: center;
        }

        .form-actions {
            flex-direction: column;
        }

        .form-actions-primary {
            margin-left: 0;
        }

        .btn-primary,
        .btn-secondary,
        .btn-danger,
        .btn-success {
            width: 100%;
            justify-content: center;
        }

        .pagination-item {
            padding: 6px 10px;
            font-size: 12px;
        }
    }
</style>
