import { PropertyModel } from "@/domain/models/property-model";
import { GetAllProperties } from "@/domain/usecases/get-all-properties";

export class RemoteGetAllProperties implements GetAllProperties {
  getAll(): Promise<PropertyModel[]> {
    throw new Error("Method not implemented.");
  }
}
