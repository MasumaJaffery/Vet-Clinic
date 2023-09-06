CREATE TABLE patients (
  id            SERIAL PRIMARY KEY,
  name          VARCHAR(255),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id         SERIAL PRIMARY KEY,
  admited_at TIMESTAMP,
  patient_id INTEGER UNIQUE REFERENCES patients(id),
  email      VARCHAR(120)
);

CREATE TABLE treatments (
  id   SERIAL PRIMARY KEY,
  type VARCHAR(100),
  name VARCHAR(255)
);

CREATE TABLE medical_history_treatments (
  medical_history_id INTEGER REFERENCES medical_histories(id),
  treatment_id       INTEGER REFERENCES treatments(id),
  PRIMARY KEY (medical_history_id, treatment_id)
);

CREATE TABLE invoices (
  id               SERIAL PRIMARY KEY,
  total_amount     DECIMAL,
  generated_at     TIMESTAMP,
  payed_at         TIMESTAMP,
  medical_history_id INTEGER UNIQUE REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
  id           SERIAL PRIMARY KEY,
  unit_price   DECIMAL,
  quantity     INTEGER,
  total_price  DECIMAL,
  invoice_id   INTEGER REFERENCES invoices(id),
  treatment_id INTEGER REFERENCES treatments(id)
);

CREATE INDEX idx_medical_histories_patient_id ON medical_histories (patient_id);

CREATE INDEX idx_medical_history_treatments_medical_history_id ON medical_history_treatments (medical_history_id);

CREATE INDEX idx_medical_history_treatments_treatment_id ON medical_history_treatments (treatment_id);

CREATE INDEX idx_invoices_medical_history_id ON invoices (medical_history_id);

CREATE INDEX idx_invoice_items_invoice_id ON invoice_items (invoice_id);

CREATE INDEX idx_invoice_items_treatment_id ON invoice_items (treatment_id);